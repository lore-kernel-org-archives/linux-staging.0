Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3898372
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 11:14:14 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailnew.west.internal (Postfix) with ESMTP id A739C2B007E7;
	Sat, 13 Nov 2021 06:14:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 13 Nov 2021 06:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=VjqE6b5MSWbkCYxsnC6r/fa9FFw
	x1X+H5FGn0sRvzEw=; b=JzJk0pwciqx0c9whlZ/i6rmrFv/wj5/2Ob0V/8zz62t
	TwZi6JKdbEbzy5qKY1cW/0KWVjxbCOff78DTQ5apBCvRHDhTkCXW5oQWE54Umyuw
	XFxf0to5pR2raZztCsReV7cXu2L9Kaslb+jWTxFmGZcFm2DcCD55cnQyKtgEOl56
	hKPkpOq4xNwTCy0lj82LDbfpXJYlufwHFv9z2LpnfRVX1q7c8hcJvOv6tvNvsu9V
	JLfODKGFrmXWZ/k6eDEcIA86u98dRp6LahA8b4K7piAw6IlQHwMmtH2n00r4eX4e
	rgipwGpdqRg4zXJRoXvGDMvc0J0+Gsrx08CVy3GQT+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=VjqE6b
	5MSWbkCYxsnC6r/fa9FFwx1X+H5FGn0sRvzEw=; b=AGO2+LTwzpBGeZQdAjwSZy
	llsMkF6pJb159MoUG+io3vuRzstO78uVgRkdIoxDz61CqREa4hYXIkK5qr7ssOrL
	T/vxfWF+a7MABw2euqHiiolnzHWahwA6T+ajfNnOdE6TPtaYur2IisFpw0YCPwO7
	KTYb9T0PnmQMwPUmYn/kRWszA3jwOpQ5U5DR5U0vTWlVASF6lmX9yYFkH0S5AFYa
	2SOmFIaMRAVPQBQi3qHPsV2VT4mIsQ1SnIbZRDpG5lpMGB2Pez6jZStAFi3EI1Ri
	cf01RoAhjkkAXG9FDFlaqoPLsZF7KLk8WHFoGaG9WoL8Is+n5zEiyW3fAHIqHLNA
	==
X-ME-Sender: <xms:A56PYQqrz07l-7DpVEk5n0wJ9w1HZAOHWYH0tZQs07Qr-KEIyzf5hw>
    <xme:A56PYWrrRMNTTblJApZf9Or51o-u0XJXebA6KLVmqlVz55xIhnuHU9qLHEiz5aQF2
    3grA4DaRrxefQ>
X-ME-Received: <xmr:A56PYVPQ8fhpekVLpEQIJGUu8CqkrsCGWyrZaAlPxoQ5kdObS_SRcq1hkKK6ZZCV8O1DhJC-EY9IOfmsD17Q1x3SGnWLVs8->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvdehgddvhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:A56PYX6xh4vGuVnyEMHqK4oGHedfC6Qu_XUnFvZ48gQW5uOyPMGO2Q>
    <xmx:A56PYf6KqXK9JwxPXMbOYOd0pVdzhrCXCgFVU8lB0-gbLnBKA4wTsA>
    <xmx:A56PYXj-Hgxx1RvaeVWC4QU8LKibq-dny3vYFSHiA4mL7ukCv6eoNQ>
    <xmx:BJ6PYTqWWpNlpxG53Cayi9MQjawTbixckLak85qFqzjXND9WIsRg4c1WgHA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Nov 2021 06:14:11 -0500 (EST)
Date: Sat, 13 Nov 2021 12:14:09 +0100
From: Greg KH <greg@kroah.com>
To: cgel.zte@gmail.com
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Changcheng Deng <deng.changcheng@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] staging: r8188eu: remove unneeded variable
Message-ID: <YY+eAVIbRXQcnzqY@kroah.com>
References: <20211110122257.151666-1-deng.changcheng@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110122257.151666-1-deng.changcheng@zte.com.cn>

On Wed, Nov 10, 2021 at 12:22:57PM +0000, cgel.zte@gmail.com wrote:
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
> 
> Fix the following coccicheck review:
> ./drivers/staging/r8188eu/os_dep/ioctl_linux.c: 1388: 10-13:
> Unneeded variable  ret. Return 0
> 
> Remove unneeded variable used to store return value.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>

coccicheck reported this, right?  If so, what did this "robot" do?

confused,

greg k-h
