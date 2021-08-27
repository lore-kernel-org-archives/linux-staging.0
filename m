Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667E22FAF
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 06:52:51 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 9B37A320091B;
	Fri, 27 Aug 2021 02:52:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 27 Aug 2021 02:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=GeE912v9isg9oBJN2YWeFxiFw5V
	6+n6JRLso0F3c1wk=; b=xgXYLsfPg/vq3T+ccXWm3e8dVo+5SZ+crzR4TJw5MFi
	FP9LKckbi5UtdxSU20EzvSfhsgQfqxivLouTH2ZX/NvdG90xht9LW3Kb4ZiWQvhQ
	5jGGVEy4bSFCs0E1JAP/mGJ/nwGDwU8W93F+ybadi7Vz7kWWRFwvhdQbxIevSMbF
	nwgnVOEumKgIDGTj4M35UUTnvLD4RcezDaWo+L0E/R1gXt9/fko+UKyQk8qC7gw+
	RtBTXDmtmOmXUxHm7UD9okV48m+UyjaNDbAvcua7i5yNoXAcg9jaRDsXxcq5ZeQj
	/U9sd9uV0Ca5ytCo+l94xE8Ra0R6IN4zPfGEguY93/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GeE912
	v9isg9oBJN2YWeFxiFw5V6+n6JRLso0F3c1wk=; b=sYtvQYisB09I53mAGtkgmg
	58WdDDUOje43u/tOC4s8GBSj/OSjDey5K8ThuDMeND3Tsm7ciSlodcF10xbhzBEf
	C3UnRlWhL1SWU/Y5wQiJsta/SH6Lm9vO8TTDshN9Sle+SeSCF3sOX6hXP1LIuFP/
	pxlw/kpZXIaBRWUMIlO+delm0F5w/A6eFiPU+6OC5tN/B3ZEIHEQqM3rD7Ep3hjB
	RZonnnjuhvFGjsSvpYp9lG7Xt6dwjR88YTkjNbaKlW+1gMg6RR14DjJLBjdd4/3h
	DJqCOgk0FZg3N+xf1DddEbB3YGR9ezwe7vJeUuMB2E4UaGbIKsujcCktIr3MqVbg
	==
X-ME-Sender: <xms:wosoYU97eRq28EdrxhhG9aezjaSHS4HgTaBNX6EVuVbw6EUlSEXaZg>
    <xme:wosoYcuWTOHqREdVgY3ImWMq62UDz_3eks66-ztXqkqSoZO7ER3H-FySwBKv1hCsF
    1p1vZPzygV5gg>
X-ME-Received: <xmr:wosoYaDumsHfhbiFDGBod_tYtjYHRDM9tUB4hXL_EzHaCFeoUwahtRZV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduvddguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:wosoYUfGvqEAq83hzCmvJjIofdnkdxnNZJPfRJPasV-UmLrENKJCDQ>
    <xmx:wosoYZP6FdypsryIqHDWOVoCV63gBEaDDP5W9HDTH9kUzsn5kKChLA>
    <xmx:wosoYele5m73KT2WUwsYST4JXlriHDWTqlaEcUlNbjrezjQLPphjRQ>
    <xmx:wosoYSangEYJsf1f4DjP8aMOvhsOkB8H78J2XhljGb5SEv93wAgW0A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 02:52:48 -0400 (EDT)
Date: Fri, 27 Aug 2021 08:52:36 +0200
From: Greg KH <greg@kroah.com>
To: Krish Jain <krishjain02939@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] Declare the file_operations struct as const
Message-ID: <YSiLtHpUlXuXE0U8@kroah.com>
References: <CAPGkw+x+B1731SL=afoSKiWwH-n-FA5YJ+WOwYdv8iyFhWk1zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPGkw+x+B1731SL=afoSKiWwH-n-FA5YJ+WOwYdv8iyFhWk1zA@mail.gmail.com>

On Fri, Aug 27, 2021 at 03:59:28AM +0200, Krish Jain wrote:
>  From: Krish Jain <krishjain02939@gmail.com>
> 
> Declare the file_operations struct as const as done elsewhere in the
> kernel, as there are no modifications to its fields.
> 
> Signed-off-by: Krish Jain <krishjain02939@gmail.com>
> ---
>  drivers/staging/android/ashmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch breaks the build.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
