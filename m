Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2722C81
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 06:50:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47E5361074;
	Wed, 20 Oct 2021 06:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634712621;
	bh=PURJ57CDCK1CRMg4ZPPC0Zof7vbwM57cPumF7fbuLJI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OuVNV+doiltxzOI0vzzO8N6FQkXjkSceYpUTO7khRcAoIZArPDbOgjk1B2/rkogrb
	 5b2VDMahz1vFawbpLSCTRd2p85ljk35uaTE1nNkDHK6sHEn4/gmuJ+bQUzR4fZfE3b
	 +H29T1khuTJAuz40cIpzEM9zD80kZM/aoQUb0o8AYidFlRELcKA9yklToJOloggdPR
	 V7IVUaqBR4SBOdys4AvRBqzftmLRr90AHIZJ3uL4NNcmRkXeURqXjKwT1S7EuNsQ0S
	 1lgJ2pPc7OZMkIaZrBasATzOlBmTO4ae4ycC5HNPrvKigSYwoWobvNAtFvJo3nky0D
	 P7ZCVBjCEh2bQ==
Date: Wed, 20 Oct 2021 07:50:15 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Tsuchiya Yuto <kitakar@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Patrik Gfeller <patrik.gfeller@gmail.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Yang Yingliang <yangyingliang@huawei.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Aline Santana Cordeiro
 <alinesantanacordeiro@gmail.com>, Dinghao Liu <dinghao.liu@zju.edu.cn>,
 Alan <alan@linux.intel.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
Message-ID: <20211020075015.316d827c@sal.lan>
In-Reply-To: <CAHp75VcDZQ1M2iNKewxqcG3C+bzSEGV05dTmYp3xXhnhNGdviw@mail.gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
	<CAHp75VcDZQ1M2iNKewxqcG3C+bzSEGV05dTmYp3xXhnhNGdviw@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 18 Oct 2021 10:56:40 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Mon, Oct 18, 2021 at 6:45 AM Tsuchiya Yuto <kitakar@gmail.com> wrote:
> >
> > Hi all,
> >
> > This patch series contains fixes for atomisp to work (again). Tested on
> > Microsoft Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with
> > v5.15-rc5. Both are Cherry Trail (ISP2401) devices.
> >
> > I'm still not used to Linux patch sending flow. Sorry in advance
> > if there is some weirdness :-) but I did my best.  
> 
> I agree with Hans, you did an excellent job!
> I will try to find time to look into this. In any case it seems to me
> that this is a material more likely for v5.17-rc1, rather than v5.16.

Yeah, it sounds to late to apply it for 5.16.

Regards,
Mauro
