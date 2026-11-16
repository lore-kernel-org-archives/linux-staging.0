Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832704;
	b=gS9IjmVLp/GVH+gcX0xuzUdqv2cEsXJmkQtd/WlUCJE3Fx9Osl7ZTPejhaOWRsOBgWxP
	 vM9m7Lx+hpypnvJNJC5m5Dtv8p07IsBK2GpoO4fBZeLFwXVg2pOril6VE3HRjeUvPMu3x
	 WBs3335LnB6WxFVM3HWesu2Xm2VDtXPTpW2TXeWqo1dYB88O+GvR1lkkETGKax2D91PMO
	 7nMwx+1DsjxNokRbYxZSvwR4KbJssKKirxE3hDKQ2lg30QyUatObUtXN4y1VxpN+Ya026
	 nDgiINlvcbp9yR0RS3eUlrv4DRbF9tlkT0JyRzojJsRT0in5OmZ+SGDVlctBSt4U2Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xs7ruyFa3AhcPBVXazJxZ8vpDg+GWQjFG2lYecJvOs8=;
	b=NgAjO9W6H9OhQYwSsgC30c0pIokC8iuVpP/hMfQbgLhutZx/BI/FqIxEVaepjDgFdEzm
	 c2OyeP39ne5slodoouBt/PAN7e3wU6C6XExe/f1AFt204bveRPa3JjvF1kTEgLXuIXP8b
	 KeacTdNZ0r1fHL8LNpojKTCzem+UiY7xfBPHGYUuby4XWFnh8A95i2lsbBxtuul8TU4Zi
	 AjMI0uU1UV6ikdYDmskn9Dpa/kBWnAfrd52rCsIyVARDfPVzAjQmV5pZVIwE9aBrU5mLS
	 9831gUAPMrgyem2hGZezJ9bA0iYm+V+pT3yAc4O76HWoFyPNb3HzgB+XgbG83MsTWnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz9G0Y1W;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC52606A329
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 12:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AC52606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz9G0Y1W
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso7738215a12.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 04:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832702; x=1795437502; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xs7ruyFa3AhcPBVXazJxZ8vpDg+GWQjFG2lYecJvOs8=;
        b=hz9G0Y1WNBhrAAwyfGuUimoYuHI4lV2BUnacST2QOmEDHEyAM9oYdgMzOluP7CRiBU
         aAlLF9MOoJxDiPSGp2SsI8GQG6xe+5E3qQrdnPadgOXwh0oDO4LTwFexvhpmULkSGBRx
         a8+HGqJH5x7unBKyWazkMcKvhfb75/1boLol0I3yTB+nP5MPOSAX+WF1VF4g5JUCYAHf
         7fjHlD+iboDKd2udiqZPckYle8g8r/cKDDUaH9Gvi/6xzhQ+PGOME3dcFeccKc38bwon
         mc3MehApfK8REIj2ZqlpjjqyCWhZMrGukyutMha/c0WQDFIwklvh3wbJsN+jju/fQn+c
         JVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832702; x=1795437502;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xs7ruyFa3AhcPBVXazJxZ8vpDg+GWQjFG2lYecJvOs8=;
        b=e3SZXnBbCKCrEISzfFnJopjV+whtDuqM2j209+vingfBD7SNRElQ0nmR8A+M1ah62c
         TZBh2S9r6jQY3ZPxS/ve9/UqDaERuMHUmWSkNNKSFNxFWNEaOI1c94QK/kaQsy+rCJJR
         bMbySCUz5hqzSb+38J/xaF6nDcYOMu8O0mhuC3RQ7kgbQgfiIlYICzs+Pk1TYqNVL5Ec
         VgjHijCtOETAuFfnBKa9j6chAyDP42nenKScBJV/Z2sgb7hirCJm/3+AeG9AKVaOnHsj
         IXGZ44vXrNKRolDXjKw8c1yjYHsY6dpeFye0ROcOf9JqoMqTQomuW/i3NrHW4j5Js82c
         HumA==
X-Forwarded-Encrypted: i=1; AL+hErEujlRpYWzuxszQb4jx4Mfqlz0kkv3LahLiWGhCM9Ui1ahg4qjr97BN5+pUOdqDNGKPjHpD+XRLYpcsxTNQ@lists.linux.dev
X-Gm-Message-State: APuU4Z8ogQ+Glz8/5qJzoKWhSxEqEU0Js042MSOmnLBv7xP1coGDWvQ0
	oLNLewdVaSjHk4AV33c380LYoPZ8iL3WcQEVwFGnmj7H5iDrhYAcEND3
X-Gm-Gg: AYBFou1lbq3v4jjM7MQHsjL2fSHY3LEE+dkeMZJ4UWHhCEcgNCUJrNNARksUTo/UKnH
	KXvkO6fx5JkCZA7C3IIJL5qNG7dUpett0HQu/macCOZsrZSDiKAHxBid8kBXvru/9qJsVMBMLoA
	KnBAcZ4Juh9Cx/mWRIRH1o9ZC+Ld1lfqZgQHyZWJKtLmUFIkt+JAJrT/oxlow0xaLqkwpPGrCfU
	xa/ZbIXqaUgDeE8UxJDwK5H1Oou/cfVvg0VvpKwlaznXSz/RWoGH0at3PWETdWR6lYIMUhfJR/0
	V1Gu7NzaYgYWkCzc68KTn2lQPDH2l/ykSFAxbJDWhwQ+1GpWFQeAqsRie9+1pordxcJ0Eg/UjoH
	hrGoygEJqBX3PAEc64u3b4l+6m3IWzjeEjAEvRf0D/jZ/Ul3WJ8yL8otKGTqO1GhoQmVCQ609RS
	6be0SLgt75g5+HMRPvl7C1YcKXwLsElFbvhWSXUFsvK/rM1UbligFwhWQYU2CwYXoMQMFFve3LG
	6cNGFvxohpW+7GPo3nYcM7jZF1trAF9tWj5RM6Oe1uOXzs1IQ/CVdChr1TmAqG1Lh3DTOjkleb6
	v/ZB0CSopnWEGxW6jLZftXpeDg1uTidoTZgH1lfo/iW0Z2cjY0D4yNvpbYAvM9HS8ZfpNTI+7iI
	8ppREMxm78cPgsKRQerZM/JjI0zPG2AU3CB+G0d0WncDHkna/MYxDlGSp4M4E9HEVv1+8VWvpnx
	hav4Pb6VzgAde0
X-Received: by 2002:a05:6402:2113:b0:6b5:962e:e00f with SMTP id 4fb4d7f45d1cf-6b7c0c6dbe3mr8755642a12.28.1794832702439;
        Mon, 16 Nov 2026 04:38:22 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm4600398a12.9.2026.11.16.04.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:38:21 -0800 (PST)
Date: Mon, 16 Nov 2026 15:38:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: atomisp: Remove unused any_virq_signal()
Message-ID: <avr5OsqqZEuOD6vh@stanley.mountain>
References: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116120703.6681-1-chaulagainavishek14@gmail.com>

On Mon, Nov 16, 2026 at 12:06:56PM +0000, Avishek Chaulagain wrote:
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
> @@ -107,7 +107,6 @@ void irq_raise(
>  
>   \return any(VIRQ.channel[irq_ID] != 0)
>   */
> -bool any_virq_signal(void);

This leaves a dangling comment.

regards,
dan carpenter

