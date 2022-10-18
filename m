Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE497B;
	Tue, 18 Oct 2022 10:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OTNfub20XKiblrmAKXf7vUMGbiYJAhN4mTRLxCxGmnw=;
  b=GoANrRpyMMbx/C0xU7QgqK/I2KJeUpmv4fdV+RD1dk9DS3Ns/BZuDuB5
   yYCDfckMv1HhBB9zTROEREUd3HQXsO3hA8FIePls2kUCvhD6KwSIjrKjJ
   DKEU+uaMqiAK1moInxN3Q8om252HWMPpV+cEiYh3/xh3ERpVnah3koE8E
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,193,1661810400"; 
   d="scan'208";a="65704101"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 12:21:19 +0200
Date: Tue, 18 Oct 2022 12:21:19 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Tanju Brunostar <tanjubrunostar0@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] [PATCH] staging: rts5208: merge unnecessary split line
In-Reply-To: <CAHJEyKWpeyBpGy74cLe55v1xfCkn4WBB6tkn+N6eXcn3G3LXaQ@mail.gmail.com>
Message-ID: <f26a5887-bf7d-1988-c11c-10844872add3@inria.fr>
References: <Y0550VcHI8NzFzzf@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net> <3f65f367-e07f-5b71-ea7c-4f13c23eca8d@inria.fr> <CAHJEyKWpeyBpGy74cLe55v1xfCkn4WBB6tkn+N6eXcn3G3LXaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1467809331-1666088479=:3791"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1467809331-1666088479=:3791
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 18 Oct 2022, Tanju Brunostar wrote:

> Got it. 

Don't top post.  Reply to comments underneath the comment you are replying
to.

julia

>
> On Tue, Oct 18, 2022, 11:11 AM Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>       On Tue, 18 Oct 2022, Tanjuate Brunostar wrote:
>
>       > Fix checkpatch warning by merging unnecessary split line in order to
>       > avoid ending a line of code with a "(". The resulting code does
>       > not affect readability and is well within the code-style guidelines
>
>       Thanks for the patch.
>
>       You don't need the extra [PATCH] in the subject line.
>
>       Actually, you don't need the parentheses at all, but that might be a
>       matter of personal taste.
>
>       julia
>
>       >
>       > Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
>       > ---
>       >  drivers/staging/rts5208/sd.c | 3 +--
>       >  1 file changed, 1 insertion(+), 2 deletions(-)
>       >
>       > diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
>       > index d1fafd530c80..4643127a87ca 100644
>       > --- a/drivers/staging/rts5208/sd.c
>       > +++ b/drivers/staging/rts5208/sd.c
>       > @@ -4501,8 +4501,7 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
>       >                       sd_card->sd_lock_notify = 1;
>       >                       if (sd_lock_state &&
>       >                           (sd_card->sd_lock_status & SD_LOCK_1BIT_MODE)) {
>       > -                             sd_card->sd_lock_status |= (
>       > -                                     SD_UNLOCK_POW_ON | SD_SDR_RST);
>       > +                             sd_card->sd_lock_status |= (SD_UNLOCK_POW_ON | SD_SDR_RST);
>       >                               if (CHK_SD(sd_card)) {
>       >                                       retval = reset_sd(chip);
>       >                                       if (retval != STATUS_SUCCESS) {
>       > --
>       > 2.34.1
>       >
>       >
>       >
>
>
>
--8323329-1467809331-1666088479=:3791--
