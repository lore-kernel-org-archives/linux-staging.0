Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE735DA4F
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 23:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777936558; cv=none; b=ipxC/Eo2oGMT0r2IlR6t+LFdM1DSxZHC9wDTmiSu8dXebBj8ymgZgp/Fd0IH2x3dQ2G3y655PccDlk3KyPiHbh9tV5HSNkxhUAzKKQ8dvK3oOnjkXxAcC8kR15Xp8PuYUwwokOV2vJzY+aYfbi6ZKYp/WsJiBU6Lk/0Ztvp68y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777936558; c=relaxed/simple;
	bh=6kA5f8/Eq1uu4hnjHTbRSXA1fMelDXAzD0GtxiZTMBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+aYNkQzDTYTFBJhfPW+x1Ey1FBeFd62bNxcRQ7YMoB4dDSa1zhsTfNsWo9tYgudn3L7C+MGydpgdFhhvCuHsDWCfptvsRWa5BjV3SNLtFkk0B/7S84yiJm3SWP+qS6Y1MQGWJb2ES3ee0IsXzGTUgKIYT+EaSr+44jsXEXNYos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6KlY0Gn; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6KlY0Gn"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c45281a06so7198551c88.1
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 16:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777936556; x=1778541356; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uJUaPNEnLT6eI3Sz+OplXWx4CX0ycNqOaqliP4b8tDU=;
        b=s6KlY0GnK3M0nJnCq3vmUGRvRXNN7YpXU3qsY7/Uyu6R2/WyBXniRCNmotBxzSv//f
         j/y6DS8Z66XAH3BkhBiTxJKd3y14XdtJxQJODWy6UO7tp053qsUAAMzDHG0B4QPef5pD
         rb3IulqqJAASnElQPYLaMIYOVWAGh1lji/HuyEw8ceVG4M4rLXdBnQLloAKqJoV0GmbG
         zqT+/ejoYvx6ho+v9qyaJhnsFDV2KpP9OPg1CSOIE5ag8imTwhzadfLXKR7JIfC+AKsP
         gth3Ipue5tTIxdEQvvDA/PwRWCGdAQ0TRPX8NEnhj5OhKIPspB3KZH07ZKn2UZQ5RrUQ
         YNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777936556; x=1778541356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJUaPNEnLT6eI3Sz+OplXWx4CX0ycNqOaqliP4b8tDU=;
        b=ZQVhTuqatEcj1dsjQIXchagkpQEkoiakApTeiTELzeZcDmFvJ7qBewhptzP1kCO7ju
         tI1mtrbb8VcTupXu+nQePXaxOiQRKYR+jo3wr8bM4b+kAnwinyrdUjq0Evjcw3+eo16S
         3/z8dzLgC03esOk2LczIfKd2t/W2vCJqLTvY4DhALFsNpi6ZFHBsYHFGSkY2jXnRgZon
         ifgPlbN7IdNv/h7FLsvn05xMcD5xRPWT+FjilWk0r/PnLrOE2FeyCeLgt+aJCKgVxUVj
         ijEBdsY1bGUe1uUZ77quCt57tbKiFQM92GeNjZthnq5Wja0C6HaVnvkoDmXPUqJ3W0iJ
         x19A==
X-Forwarded-Encrypted: i=1; AFNElJ+MaHLNGdPM4xliFWRjMQiiWRTldvM+JRYZU9fPtgoJfIsEOBHO92A04nb2o7pYpt/rtUM8YlTsRrJ5DQsk@lists.linux.dev
X-Gm-Message-State: AOJu0YxsFdf4MI5e0eLbKG7VIqaABipIj3pPxXF8tByyRcr8rkDDnHOD
	Ju52WgisAYy5GQsW/Nr32/P5LaRGaLiGnuKslS5e0PA7EexEnr24+1Pw
X-Gm-Gg: AeBDieu2gHrZ8c6VQPPSnib/1i8QVLkiyRIrRUcrp7t6Qcuba0XQKWRPp/CuszzbKxc
	4bAcej5sNyPdSzmFHW8jB/at4jJNgwFNIv5BhUTWpBHQ8BUbeVnap9kXJ6KPMv3dNv7nwIarM8m
	h0YC0CYxvmwLIq1EkNUb1owB+B6lKitGyFL4WVLzDMfDldhOniWD9jnV9KKv8/pyT+5q9OpWUS2
	jChJJhP4lkVb2agd1muiFWQMUpB7usWlreY7gAKTuMYsRiwN1VkMPyrC/FsXXrH+fpSQtmLSXBb
	wKKrLb/XiNUlhJViv1TWNSjG4kqlZuMAfALxiUbwEkVRkD73pfoI9iX62ViYXNRUu02NhmY1cJi
	hP0zsjFyCetGeebnk+lV2EOxIBH106ZzZuR+M6W1m7Nqfv94BS9ixqEIvzmAiRPNa2q8Cg5tZ6/
	L1MpJXmifO73vcqDiuZniATL9RI+o7Ucf+nlhxreaW0eFACout+p52xC5BnD4vM5VcTfhe3QDFW
	auTEcXPvRHB0g==
X-Received: by 2002:a05:7022:605:b0:12c:8b9:7208 with SMTP id a92af1059eb24-130b1b67874mr477748c88.26.1777936556135;
        Mon, 04 May 2026 16:15:56 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5b87:9b19:32e2:2981])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84252c0sm20605766c88.10.2026.05.04.16.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:15:55 -0700 (PDT)
Date: Mon, 4 May 2026 16:15:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/4] HID: wacom: use __free(kfree) to clean up
 temporary buffers
Message-ID: <afknxbpP7oj4bNab@google.com>
References: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org>
 <20260504-wip-fix-core-v3-4-ce1f11f4968f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-wip-fix-core-v3-4-ce1f11f4968f@kernel.org>

Hi Benjamin,

On Mon, May 04, 2026 at 10:47:25AM +0200, Benjamin Tissoires wrote:
> @@ -386,10 +381,11 @@ static void wacom_feature_mapping(struct hid_device *hdev,
>  	case WACOM_HID_WD_OFFSETRIGHT:
>  	case WACOM_HID_WD_OFFSETBOTTOM:
>  		/* read manually */
> -		n = hid_report_len(field->report);
> -		data = hid_alloc_report_buf(field->report, GFP_KERNEL);
> +		u8 *data __free(kfree) = hid_alloc_report_buf(field->report, GFP_KERNEL);
> +
>  		if (!data)
>  			break;
> +		n = hid_report_len(field->report);
>  		data[0] = field->report->id;
>  		ret = wacom_get_report(hdev, HID_FEATURE_REPORT,
>  					data, n, WAC_CMD_RETRIES);
> @@ -400,7 +396,6 @@ static void wacom_feature_mapping(struct hid_device *hdev,
>  			hid_warn(hdev, "%s: could not retrieve sensor offsets\n",
>  				 __func__);
>  		}
> -		kfree(data);
>  		break;
>  	}

I'd recommend establishing a new scope for the "data", otherwise it is
fragile. If there was another label below then this cleanup would
explode since current scope of "data" is from the declaration point
until the end of the switch statement.

Having a dedicated scope makes lifertime explicit.

Thanks.

-- 
Dmitry
