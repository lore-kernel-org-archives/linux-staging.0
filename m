Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766342C1B7
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 13:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="epDTVOn9"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-425c54f5842so24985091cf.2
        for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 05:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702473219; x=1703078019; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Qo5R6yTzwaWH5LM+yEuRkuuzL/LOwLG4Rnp9GlOsN0=;
        b=epDTVOn9ST3h4/FZXS7mVpCrGsmS7xY/QdkqzDEpfl709wo03zCevpC7rd5gC5F5t+
         CP+IZtrXhoyVX+U/xhfAShJGVabVVp/jsqkJ7rFlA0lCb0UiaDqvRaPoCMJhhouIRuC6
         Ng5AByxOwymXMQMD3uU4V4i4IBnORIoMRhilJXUKyEtmAcLu2qd2lKo+IQNeSw64mD3P
         xtsVuFwemPTrIDAqMhQc/kbsMfp2e1WAaR3klrIZe7IMLgNJCSFZXaKlQT45WHZPTQzI
         WUrsY/wWPi7e377qJ15SgDYq+/sRjq0/D1gVMYKIE3Hp9dKKDiQ2e0kpCa9On2tGJw0J
         UF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702473219; x=1703078019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Qo5R6yTzwaWH5LM+yEuRkuuzL/LOwLG4Rnp9GlOsN0=;
        b=nEJzCFtF+llPO2+gHYgogZgEUnTbokY8sJlhzzj6pqzB6fur32UuxBz2EkdY676G41
         9wrrfclul55K2LJ8TpiUIBVqKWjADmFlvxjBhzW+wsaN+P+31vO8nJ26WRVydsfqVCu6
         yk2ezcalspT7p7JqA0BQ8uOgusHohoE4+aBwu4i7eclPaB6kV7Blr38dhY/tybic/90T
         aVyURm57BSoGvq7Jqdoyt/mlin3EgmXKK1x06p/vAWyeRAtzaFOJuLwzwwq2do9cTZpK
         yv0NNVtfVTe6TssNy3FIvmU8Fgu5PN8eGiNdSNVT55HlUqA44bgwU60toVfZbokE2dtD
         +x/g==
X-Gm-Message-State: AOJu0YzF2gUQxUsD9X5UxvQvlNqImOVkLuP2SxZiIX/PoZCt8HQA0sZC
	wo22dwa/MHnhZXwk8b+Zjjk4yA==
X-Google-Smtp-Source: AGHT+IFiXyPVZqdJtAPBMBKl/zR7/AwrfluYAbKiw6zzrn8OLvxIyWqo3MQ7VLohJVWc7AW8Q3QsNA==
X-Received: by 2002:ac8:5909:0:b0:423:7d92:ddba with SMTP id 9-20020ac85909000000b004237d92ddbamr10443139qty.5.1702473219241;
        Wed, 13 Dec 2023 05:13:39 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id p18-20020ac84612000000b00423e77c96adsm4871616qtn.94.2023.12.13.05.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:13:38 -0800 (PST)
Date: Wed, 13 Dec 2023 16:13:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: xueqin Luo <luoxueqin@kylinos.cn>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, xiongxin@kylinos.cn, wangqi@kylinos.cn,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [RESEND PATCH-next] staging: rtl8723bs: replace deprecated
 strncpy with strscpy_pad
Message-ID: <f0abc689-a084-4c74-b5fe-3592eceb3399@suswa.mountain>
References: <20231213011840.10005-1-luoxueqin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213011840.10005-1-luoxueqin@kylinos.cn>

On Wed, Dec 13, 2023 at 09:18:40AM +0800, xueqin Luo wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> We should NUL-pad as there are full struct copies happening in places:
> |	case NL80211_IFTYPE_MONITOR:
> |                ret = rtw_cfg80211_add_monitor_if(padapter,
> |						(char *)name, &ndev);
> |                break;
> 

I don't see where the full copy is...  What you're looking for is some
place that copies "mon_ndev->name" to the user.

> A suitable replacement is `strscpy_pad` due to the fact that it
> guarantees both NUL-termination and NUL-padding on the destination
> buffer.
> 
> Additionally, replace size macro `IFNAMSIZ` with sizeof():
> |	struct net_device {
> |		char			name[IFNAMSIZ];
> |		...

This would normally be the right move but IFNAMSIZ is a really standard
macro that everyone knows.

When I'm reviewing this code, I later on see a line:

	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ + 1);

That means name must be "IFNAMSIZ + 1" characters long or it is a bug.
Please find out where name is set.  We need to know how long it is
before we can go any further.

regards,
dan carpenter

