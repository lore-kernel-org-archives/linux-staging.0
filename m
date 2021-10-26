Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11B02CA8
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 08:26:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0928A60F92;
	Tue, 26 Oct 2021 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635236804;
	bh=wm89hxmA4nHA2pHltk+Mqa3H67nOz08tsufmlDhKPS8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dZZvqoIaVw3K7Je2UwOh/V1gZ6JGdPvmpYL8B/DoRdfTrHyWpF9L1uQnqSfXezGpq
	 Cpxvrrni4edbrd6yf90cJGHpPEIlhROfAsOxpSYMHV2XrvvlqZP1EbkA0UUp9ZzBLX
	 Nn7nxjepW77jaRwDWUsQunugj6QOYW/okV1eu6OO1EPf23LlyM/qZWlDEt0CsdvTn8
	 7WgHojeHcCrsM48y/E0uzzAvPgSC5HOjcnUMIZneDXwTypggYI8t6NyApJZBVThWeY
	 tPpVBT37WnC9TYLjHxwLjMyGqkxz+2TUua6VgL6qUsOtd6hh/o5ECbhis6gwp0WUKO
	 Sy5fMlQPPLGlg==
Date: Tue, 26 Oct 2021 09:26:37 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Tsuchiya Yuto <kitakar@gmail.com>
Cc: unlisted-recipients:; (no To-header on input)@bombadil.infradead.org,
 Hans de Goede <hdegoede@redhat.com>, Patrik Gfeller
 <patrik.gfeller@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yang Yingliang
 <yangyingliang@huawei.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Aline
 Santana Cordeiro <alinesantanacordeiro@gmail.com>, Alan
 <alan@linux.intel.com>, Dinghao Liu <dinghao.liu@zju.edu.cn>, Deepak R
 Varma <drv@mailo.com>, Alex Dewar <alex.dewar90@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
Message-ID: <20211026092637.196447aa@sal.lan>
In-Reply-To: <20211017161958.44351-5-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
	<20211017161958.44351-5-kitakar@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 18 Oct 2021 01:19:44 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> Currently, the `port >= N_CSI_PORTS || err` checks for ISP2400 are always
> evaluated as true because the err variable is set to `-EINVAL` on
> declaration but the variable is never used until the evaluation.
> 
> Looking at the diff of commit 3c0538fbad9f ("media: atomisp: get rid of
> most checks for ISP2401 version"), the `port >= N_CSI_PORTS` check is
> for ISP2400 and the err variable check is for ISP2401. Fix this issue
> by adding ISP version test there accordingly.
> 
> Yes, there are other better ways to fix this issue, like adding support
> for ISP2400 to ia_css_mipi_is_source_port_valid(). In this way, we can
> unify the following test:
> 
> 	if (!IS_ISP2401)
> 		port = (unsigned int)pipe->stream->config.source.port.port;
> 	else
> 		err = ia_css_mipi_is_source_port_valid(pipe, &port);
> 
> However, the IS_ISP2401 test here (formerly `ifdef ISP2401`) is not
> a result of real hardware difference, but just a result of the following
> two different versions of driver merged by tools [1]:
> 
>   - ISP2400: irci_stable_candrpv_0415_20150521_0458
>   - ISP2401: irci_ecr-master_20150911_0724

No.

While I don't have any internal information from the hardware manufacturer,
I guess you misinterpreted things here. 2400 and 2401 are different
hardware versions. See atomisp_pci_probe() logic.

Basically, Cherrytail and Anniedale comes with 2401. Older Atom CPUs
(Merrifield and Baytrail) comes with 2400.

> We should eventually remove (not unify) such tests caused by just a
> driver version difference and use just one version of driver. So, for
> now, let's avoid further unification.
> 
> [1] The function ia_css_mipi_is_source_port_valid() and its usage is
>     added on updating css version to irci_master_20150701_0213
>     https://raw.githubusercontent.com/intel/ProductionKernelQuilts/cht-m1stable-2016_ww31/uefi/cht-m1stable/patches/cam-0439-atomisp2-css2401-and-2401_legacy-irci_master_2015070.patch
>     ("atomisp2: css2401 and 2401_legacy-irci_master_20150701_0213")

What happens is that there is a 2401 and a 2401 "legacy". It sounds
that this due to some different software stacks that are reflected both
at the firmware and at the driver.

-

On other words, this patch requires some rework, as otherwise it will break
support for Baytrail.

Also, patch 13 should be dropped, as the firmware versions for 2400 are
different - and maybe patches 8 to 12 may need more work in order to not
touch 2400.

Regards,
Mauro
