Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EA82C81
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 06:48:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6B38610CB;
	Wed, 20 Oct 2021 06:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634712523;
	bh=MNfb1++EYpc9JxhagAgZLPvO4LJwE7gvMKEM/LbN6i8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u9MygGq8/TTQ25w1YPANrQUCmrRNQPVHQg08ROhbft6I7cd09LGuGuUN98+XgSbKb
	 d39fbfycs9YExiWCN8xM36SsKNUnooDMyWASm/LDXcuBVan2sJscq7bIsDtLA7IZi6
	 DgRpJzAhq7bokFh/ZcgXXwuodBZewVva2VZgCEXmEl/8ZAW0ocmhHcEbf9ubbbZXjl
	 5w3u3xWZ8gw4x+9axAoO4/fOp5SFOX/VZGVXuGt3llQZgaXXLzv9JeCNIVLmhUVcNT
	 t0IaQpOs+mV2sVqVeRaxo7GlQOmaO7G83cdd04v0JP1gp3HgI6ytQ2JiteEJXhMmWI
	 byVHMk1rJlw3Q==
Date: Wed, 20 Oct 2021 07:48:36 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Tsuchiya Yuto <kitakar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Patrik Gfeller
 <patrik.gfeller@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann
 <arnd@arndb.de>, Kaixu Xia <kaixuxia@tencent.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [BUG 0/5] bug reports for atomisp to make it work
Message-ID: <20211020074836.42476792@sal.lan>
In-Reply-To: <20211017162337.44860-1-kitakar@gmail.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 18 Oct 2021 01:23:31 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> Hi all,
> 
> These mails contain RFC patches, which are almost bug report and some
> are just bug report, for atomisp to work (again). Tested on Microsoft
> Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with v5.15-rc5.
> Both are Cherry Trail (ISP2401) devices.

Before start looking at the patches, let me check if I got it right:

Should this series be applied after the series you sent earlier[1]?

[1] The series which starts with this one:
	 [PATCH 00/17] various fixes for atomisp to make it work


Regards,
Mauro
