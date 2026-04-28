Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF5D28C037
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383475; cv=none; b=cS7M1QnnmVsts7Y3zFV0vjiH1tylwyvWyly0O0yqGaJzrAAOi7DZhzcQVWXpUvV+ODabQVJZqbPPIGNpxID5WCFLjqod6OonM5ZkkHuwN3k4qi5nB/qpueMHvrc7oDPLHnlDMoP85gB2soWMhYgsNmND+Zl864Hg1h7LmklhPWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383475; c=relaxed/simple;
	bh=SQHXDGhlN0CKDU05O67gYV+qSo6uKu9tcDe+F+cIKco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUSLFWY9tuASTfeTJhU15w8G0jM8U85w3QTSn/FmWEZ1U5TlAa6HiInRMkjj+I6fOlADChkAg2PxZQPltJ9oa/nmM201pXUAv30lh8UZ0oCdQLJyO5i0b/Z1Bdwew6q/Ddt4R+fa8go8UGfzEYvbLuwZX3C8iNdm827Clu1qc84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cRtZgpiP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cRtZgpiP"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so1905733966b.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777383468; x=1777988268; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RHq5MBFE9EcTuWJZwxZrVzl/yev30bjkGe3MAVogf3g=;
        b=cRtZgpiP0z9EvyQwZuaY8HY9eCi3SUs1cMdoxqlXyTwqHzzR52Ib1QYlyQxPvKK4BI
         9qi4pMi8d91O/ciMUZ23cM1bEdlYeupMXaZf2M2c7r2BJqiOAkkVzD81Kq2fwuAWvphf
         yQgYgc2iWMrwpUMtjLuClyoilcagJ6oMOV8Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383468; x=1777988268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHq5MBFE9EcTuWJZwxZrVzl/yev30bjkGe3MAVogf3g=;
        b=m55sAaS5lSvHfNrhIv73LoQvQ7EgzQEXal5PPso8MSb6NIDtYqG6G/cVModj+ldBS8
         ikHG7cf+WaaXQ+l7kgJtNCdMaKwERNiDtY8JOC+uCBO0tYg52NUGxSCd8vWbTWlyp4Nt
         /zx7JzvoCjNvscA4sxCpLff/8xSCjQ9wxwQN7HJ1z9+UekLbKrjkj0Jgn6ExwLOpiL9j
         xhn4QE2tXAbC7SzHv86fZhGZrRwpbRSYDuDNY5RMpR4g6Tu+ERG7F5IImLtFsrGMrCUL
         n2YMAktk91AbbL3tUZdXKA6LAW1hBavJjBPrq7x9fa3yrziBXqMlwZNZ+1SEEQk719VC
         dYMw==
X-Forwarded-Encrypted: i=1; AFNElJ8DhkRpHf6up/5WJ9UJk7EaR5j+zH+CH8b96CIMVApIi+3UzJT5+/FVZfxRUxyoBnCMQa4lXzMg/4AH3i8E@lists.linux.dev
X-Gm-Message-State: AOJu0YzGw89B8wgAwMmSg2m9EAtk6UElcQVXQQVo3fmBeLiasSy1oSZ6
	eMG8AlPtNACa+yLk6OsZ34xXUZwsRdSrY0cjx5UGAwO2TXjQkM1OLXXh+vfUtCrm1B+L2nWCJpV
	Ndz4ugVOx
X-Gm-Gg: AeBDieucGXbyeA7l0y/TPvLxBdvrDCSDA2v5nNpaLS3SJ5OjeZ/OcxQ0FXTZmgtsMTg
	SAEBCJF0NuhzcHLvmVObR3r+P2/AAslOMqLQMbg/ZyNyTE9FVGLoa1WKPAfUqL1R/V3P5oC9nIP
	5HodlqfLin1BHaQ3fOwLCOUjaiCsqg0xlMcVAgtZC0MP81PP1gfp1//YzqElwyTByx0Na561DTc
	oxNw0twraSsOIT33G2tNxVa/WwvMzyCbyVBfG6EPgCCCW3JwIsgcgf1s2xjgBT3cY5N2oNnsb4U
	xGJI9aCh1u7y7UnAja8Ek0QRtwtknZmhYZdS24iihaG48bjV2QOoBmTKIjl38Az/Qpy4CgMV7XF
	1WZj2FZUiPH2eT2O+J3psGMUnzEuaBtClcWByW4DwB6dOKJkmXCIrl17ncAEcgJKsZClcGF3ajJ
	/OiqzhfYVtm5dDkwsSXcF2vHB789FFAPdlXKHzJaECPVysssSyYsC7tqk9Md7UNvwfr+7E7wk=
X-Received: by 2002:a17:907:970a:b0:b9c:b069:8ac3 with SMTP id a640c23a62f3a-bb80100def1mr184409466b.3.1777383467990;
        Tue, 28 Apr 2026 06:37:47 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb8057df17bsm106464066b.0.2026.04.28.06.37.47
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:37:47 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8f9568e074so1885790666b.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 06:37:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9N7HNuWm5ASTpZKvuGefITYqM6nWhy7WQfhJF7QQCiBXcY4meVhhbP5NDkHZITCCLyeMBuEj7E1Sh0yobm@lists.linux.dev
X-Received: by 2002:a17:907:928d:b0:ba9:2611:31e6 with SMTP id
 a640c23a62f3a-bb80100e760mr207203766b.6.1777383466155; Tue, 28 Apr 2026
 06:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-2-46890dffb611@chromium.org> <20260428132524.GC120836@killaraus.ideasonboard.com>
In-Reply-To: <20260428132524.GC120836@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 15:37:33 +0200
X-Gmail-Original-Message-ID: <CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com>
X-Gm-Features: AVHnY4I9JlmrxhVAZa-s9WvlzX0ziQwglaziYU7IOODauoNSlCyTGKWM9aV5MO0
Message-ID: <CANiDSCtm4Nh4Ub4rbEBvpjV8GXT9VQ5eFXZTHn=Wy=0RpR=3JA@mail.gmail.com>
Subject: Re: [PATCH 2/6] media: i2c: mt9p031: Rewrite a bitwise mask
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Keke Li <keke.li@amlogic.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Tue, 28 Apr 2026 at 15:25, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 28, 2026 at 12:41:08PM +0000, Ricardo Ribalda wrote:
> > The current code makes smatch a bit uncomfortable:
> > drivers/media/i2c/mt9p031.c:799 mt9p031_s_ctrl() warn: assigning (-1952) to unsigned variable 'data'
> >
> > Probably because smatch is not clever enough (yet). Do a simple rewrite
> > to make sure that smatch understands what we are doing here.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/i2c/mt9p031.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> > index ea5d43d925ff..5c9dff030b4d 100644
> > --- a/drivers/media/i2c/mt9p031.c
> > +++ b/drivers/media/i2c/mt9p031.c
> > @@ -795,7 +795,7 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
> >                       ctrl->val &= ~1;
> >                       data = (1 << 6) | (ctrl->val >> 1);
> >               } else {
> > -                     ctrl->val &= ~7;
> > +                     ctrl->val -= ctrl->val % 8;
>
> This is less readable than it was :-/ Is there a way to avoid the
> warning while keeping the ~7 ? Maybe by assigning

I guess it is a matter of taste. I find my version more readable.
Also yours do not seem to convince smatch :P


drivers/media/i2c/mt9p031.c:800 mt9p031_s_ctrl() warn: '(data << 8) |
(1 << 6) | 32' 16775264 can't fit into 65535 'data'

ribalda@ribalda:~/work/linux$ git diff
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 5c9dff030b4d..f9f51d5060f6 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -795,8 +795,9 @@ static int mt9p031_s_ctrl(struct v4l2_ctrl *ctrl)
                        ctrl->val &= ~1;
                        data = (1 << 6) | (ctrl->val >> 1);
                } else {
-                       ctrl->val -= ctrl->val % 8;
-                       data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
+                       ctrl->val &= ~7;
+                       data = (ctrl->val - 64) >> 3;
+                       data = (data << 8) | (1 << 6) | 32;

>
>                         data = (ctrl->val - 64) >> 3;
>                         data = (data << 8) | (1 << 6) | 32;
>
> >                       data = ((ctrl->val - 64) << 5) | (1 << 6) | 32;
> >               }
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
