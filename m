Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB453D0B8
	for <linux-staging@lists.linux.dev>; Wed,  9 Sep 2026 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965222; cv=none; b=YJ9jtQIzQi7dYny3lxj+9d7E1ng6Xc6YFyo11ySmrJARqtuYNmqrH1lRdp4GMUsz72w7sjsIlobRUQQexIW0pahcvJyU6D/zH2cKo9ErtXWJxDOXd6SCBiAYER7//znm7vp/Cnt+wlWGwLdiYNM3Cx8QkcqyF0tfE8JHzzw8vEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965222; c=relaxed/simple;
	bh=pguejnL+A5o2WGc+BMCSg4ArHq3ngSz1/W9peL5ivCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plvLKpV+r8ROgaH/vYhLiDvEByvkiQFdLm3HIltTK4opfDGj9fPdUkby1svB86ecEsrbqCFv9UrssyeZaAPTEXWIlbar7ISC0+wjcXVSvggR2x467OWX/UswKcDJ16sVforVrr9xj1sG54SSI5pR5hXZ8HNMwgjFlPlpAD8p3YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geinUBtJ; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geinUBtJ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so60843166b.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Sep 2026 07:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965220; x=1789570020; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ILVFuBMzvh4BwWf3OUKzP/jCnh2cpNBkpAfMu20Dtes=;
        b=geinUBtJYq54CS50+UT5EctcNZFPsFthQTnBFL2C4+yt3Y9mOL4l5jqAtT1Sy+dn+t
         NiKuMtC2iGO/JhWq+vGj6mvxMf02PUfWdTfeAvptB/BiLYg0pO30eS9iQ8GFEMJlhNeL
         ZE7Jc6obSfyDwwbuN2ouUuNAiRiFzq62GxRMclL6SL89pNBxM8/oX6ZORKdQwndG+HH3
         Zkznwh1mXEspVl63PnlRD/9bDf5GIA02cZDLK1XCCsPXdqry5rjuEuw49zzdENz6PpSi
         hN3FfNpVX4x8fLkgS8YWDJqBo8byUzDrUGsYI63ml4EongjwLb0vLyKBPM3j4Q0pCYYn
         NmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965220; x=1789570020;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILVFuBMzvh4BwWf3OUKzP/jCnh2cpNBkpAfMu20Dtes=;
        b=BodJKqTZDwaNblaei8qjT46V4thvyRy8rvPPEZNnHXVZ5tTICps5M4izV7l9yJncP0
         ekIy38zTUvXUkUEkpDsdrg5w6WJwS3nkpVoNSHew8SS4AUquQRNdj20LkXYV5SNBW1J4
         zE//9OGJBH+rT+u+lOKT/7z+3PnfN5Ob0g7ph5OD828nRreeIQjVbW3CwiIG1gKZ0LS7
         Jlm0m/74oGK+ZYuI9e0EPcRyH5xkr2B1+O+1WE6zcMoNkb9QqhotTtksRRSpfHQMsYiv
         WJGWEbjuRabuIlZ2yvMVHwNiA5Cp1lNv9uB4mO3bW9h1jN2GlPu3NoherQZ9BF9TDBXM
         w3vw==
X-Forwarded-Encrypted: i=1; AKwUvByj4Xb0cgsHsQpD986tu4KC0GgxMZ6kSjZ10OZg/T2cpTwhDNdYQpMXQxtcjj/zytBBf0Wqj2BeMyLv9099@lists.linux.dev
X-Gm-Message-State: AFuF++nnzBvpBwc73WDSUl9zaO/4ZRuuBkEOnnRb/tJ6z9cmDEZWcFMR
	7vx+HjG766AdU2v8MMibSnNcu9V0GSn6vHoEt1i88cg21IAhJTGfQYRy
X-Gm-Gg: AYBFou0ZiNa7IMfJ0XYHUt5Q6UL//BXh2Iv0UzpYVwaZIvniarwp/rUYBxhUkvR9fRs
	GaQN7UwATU7z5Ctbj9YjU1+fY3A5JI4/MXZhxcOlQC+0IG9DIW1Jhrch4yKNq1nXUdt8efsgQLC
	mwAOfobqabcbX79QJa1zgw0vDpjby+VZG2iZPihJC1JKh/SMY3wi71KUhrr+F0gXl6YKH8PBRXH
	x7aPwtATRSBlakNOXxJFF4VVl2FU0ThubeTsikyWGnrpb46Pi25WKp80+mpU2thvdrrPUyhoyti
	XjF99cmbzwtpqUuQyA71m0h3xuLdyuPyvvA60YvBQASGR3u30bEMoR6bDWgOlpmurFXZhK0xc70
	hwU7kxVlhlos9PUp8qaSPbwiuCsGnoir0qVFkKR2SegSpAuveGmS1MsnRT3E41W4ng4ihZHUgqG
	UEamnqKCYbBrOOZXzQmk0IBC3kWwdgYiwcVldPVrMXdXwQNkJVoOfg6Qv2O5+DS+KNick=
X-Received: by 2002:a17:907:c60e:10b0:c29:4415:2ebb with SMTP id a640c23a62f3a-c2944153128mr14700666b.8.1788965219439;
        Wed, 09 Sep 2026 07:46:59 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26e956ea81sm582118266b.33.2026.09.09.07.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:46:58 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:46:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: contectforbusiness@proton.me
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"rmfrfs@gmail.com" <rmfrfs@gmail.com>,
	"johan@kernel.org" <johan@kernel.org>,
	"elder@kernel.org" <elder@kernel.org>,
	"greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] staging: greybus: light: add comments to mutex
 definitions
Message-ID: <aqFxXt8NJ8bMVUV3@stanley.mountain>
References: <PqjvDjNm1A3nH3BCu_rlHx6YLIzrr0r8McQL1Xbg5GX6VcF6GW49nKPhkTIcHashk4ktOEARq8_izQ6xyFqeWAliK0JqQ8MMPOrFIXSowcw=@proton.me>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PqjvDjNm1A3nH3BCu_rlHx6YLIzrr0r8McQL1Xbg5GX6VcF6GW49nKPhkTIcHashk4ktOEARq8_izQ6xyFqeWAliK0JqQ8MMPOrFIXSowcw=@proton.me>

On Fri, Sep 04, 2026 at 05:56:25AM +0000, contectforbusiness@proton.me wrote:
> checkpatch complains about:
> 
>   CHECK: struct mutex definition without comment
> 
> Add short comments describing what each mutex protects.

Is this an AI patch?  Why write a short description?  That's the
opposite of what I want.  I want a complete analysis.

> The
> channel lock protects the channel state and lights_lock protects
> the lights array.
> 
> No functional change, just quiets checkpatch.
> 
> Signed-off-by: Vaibhav <contectforbusiness@proton.me>
> ---
>  drivers/staging/greybus/light.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index cab02b5da..a036fa2a0 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -37,7 +37,7 @@ struct gb_channel {
>  	bool				releasing;
>  	bool				strobe_state;
>  	bool				active;
> -	struct mutex			lock;
> +	struct mutex			lock; /* protects channel */

This comment is useless and wrong.

I hate this checkpatch warning...

regards,
dan carpenter

