Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F18117BA2
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 04:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724734409; cv=none; b=sZEnbxfozfc/j+Il9mqdMCMR751pLg4pahZa/GFIQyATMNqxzMxPWbJqDuoGL53Trs0rknL/ci/o32jtyeNrP5FzAA6TnCMxo+xZa5F1oECcC7ToeRimpoRuUmi7P4IcvSVWYY/MIRAZCvUGl8BBc+XCfcmvDvmNlCYp0c5qrq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724734409; c=relaxed/simple;
	bh=q/hQZP8UzpGL/LhuzuoMykaERVhMUp5s2HScjglDtU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IBeqt3mPIATjBW6paS9YzfPT5Ukbbtvlq6GrudY+HZFieUgtFVWdjUdQtSb25ukjDEKHFBJFRxKzaW3UO75wLUgyMWx2gofgzFE/5Z+8UaqAI/x2gbqfyLaGiz+qVvJ4tpjo9UKN8P7bEiClojMyRij9v24Hz3q/6xZwzmRtfuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/kU2Jdn; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/kU2Jdn"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a868d7f92feso639830066b.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 21:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724734407; x=1725339207; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GTp+zaC29qJ57UbVln4wBICMkhO3MDkLmyDFbXQyWmE=;
        b=N/kU2JdnTrpDTwVFfgrNNmGMBAl6Rc/61Ibs5dTdM2dTI3CXv+SYmzbecesVORtabH
         oiDoBfVuDKBbRM5+BVGGn46VTuOCX9ltbJmuWjLO6KBsjcYsG/Yb0m474FtqdJEByvJX
         lmcT5wp5GzJcRrau4fkuOgB3zzH9R5Q2dA+K/daNBsv61/gGAx1yoQ0Kl84ix6QNej0Z
         QHaIcMHjx9Va5tR7/ZDSOVy9gxccMcdba+hA98BmoqWDjGpNOQIJlG2VEVYXT06sL4vw
         ZvxzoWUVmZqCAcJHFxutXtP1OFZzl0fksqCx1GD1XzmRqDeFvRQq56D1CoLo5/jeKh/7
         ek8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724734407; x=1725339207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTp+zaC29qJ57UbVln4wBICMkhO3MDkLmyDFbXQyWmE=;
        b=Yr03PRMQGHBwGOWAJb3ZTaK4DW/wRvHa9D1bBfl6j+3/+91Hy4wPsNvh3PNGLxbooE
         dY/nkeHiJypze/Q1qOtrmL8xPn8uA31H7z8xxKks6aloYMOQaMB4xa0olaKOFwUsn+mM
         1LCw765wWtrcl5AVs89GSR3tvGkwmhTV7NmYgqkSy9V4Y8+Y97VsUGX30Fzt/38PMv/b
         HkjMrJ9NdwonI8M27FrKh8ERhv9WaPUSWOOAWw6ffA9/qx4VDM00PcY95gG5oTiSl7qf
         7GnRh35Prx8uf3XFYFQ5Wk7oGinjeGKfrWnofv6i2aXkPmqPONTo6C9KoMyQTvHSy4fL
         ujcw==
X-Forwarded-Encrypted: i=1; AJvYcCWdE+9ijnZ1EY6mpTlgbLejy8xfG4BSNEaaLpduds6z9xdvdumkMiCdBOBmcm3UcmbQyIVC9qUpbfYi9uGw@lists.linux.dev
X-Gm-Message-State: AOJu0YygsfmDIr/RXK4VA3F884xe1UeOapGLzqD+vdMl3d8S2EXi19x/
	ajKUcElIK/chCOUPSPaK1nCG7GQAH4AusDDJtXN100V78iN+pIis
X-Google-Smtp-Source: AGHT+IHkJ/mM6p0n3CXzIgSEp9TLTiC012zCp0zk9t0yY4TQHoZJH1K0IWibkZS+5i9MKoII5Qke+Q==
X-Received: by 2002:a17:906:f59e:b0:a7a:9144:e23b with SMTP id a640c23a62f3a-a86a52b6124mr723732366b.19.1724734406319;
        Mon, 26 Aug 2024 21:53:26 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e582d658sm59276266b.99.2024.08.26.21.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 21:53:25 -0700 (PDT)
Message-ID: <e94dc4ae-28c4-42d3-8df7-fb68e4829f8b@gmail.com>
Date: Tue, 27 Aug 2024 06:53:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] staging: rtl8192e: Fix multiple assignments in
 rtl_wx.c:529
To: Alien Wesley <alienwesley51@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 ~lkcamp/patches@lists.sr.ht
References: <20240827001107.10641-1-alienwesley51@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240827001107.10641-1-alienwesley51@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/24 02:11, Alien Wesley wrote:
> Separated assignments for pairwise_key_type and group_key_type
> in order to silence the following checkpatch warning.
> 
> CHECK: multiple assignments should be avoided.
> 
> Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
> ---
> v4: Squash v1 and v3
> v3: Fix typo in commit message.
> v2: Removed two spaces in front of "=".
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> index fc8e7f73b2a4..67c4793e0fc1 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
> @@ -526,7 +526,8 @@ static int _rtl92e_wx_set_enc(struct net_device *dev,
>   	mutex_unlock(&priv->wx_mutex);
>   
>   	if (wrqu->encoding.flags & IW_ENCODE_DISABLED) {
> -		ieee->pairwise_key_type = ieee->group_key_type = KEY_TYPE_NA;
> +		ieee->pairwise_key_type = KEY_TYPE_NA;
> +		ieee->group_key_type = KEY_TYPE_NA;
>   		rtl92e_cam_reset(dev);
>   		memset(priv->rtllib->swcamtable, 0,
>   		       sizeof(struct sw_cam_table) * 32);


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
