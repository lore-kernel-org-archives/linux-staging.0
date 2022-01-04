Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AD12C9C
	for <linux-staging@lists.linux.dev>; Tue,  4 Jan 2022 15:34:54 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id o3so18755483wrh.10
        for <linux-staging@lists.linux.dev>; Tue, 04 Jan 2022 07:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wUmxQ2CKmUZwcrN5uTGmilHnj2rnj+XkjhOUMtgeq20=;
        b=g1LECz3y5ju9IcfvJz5hsPoUyZBUz3pK133gvGgSNX9xGSyfnT5Xf8AKEV2I5QLFjS
         JZ2B7xSbgx66c+MdQOs90WCC/SB4Ka2PI7xMyyCMeHnzxxJUWNf4AB1zAkEQdaLGrW19
         R/4btO4fvefAdXbNEEJ9gzf9sTM7CTnZ+ubtjbb2PVu1ThQDuE90+J9527wL33LJnTFt
         bGFOmylU6fuC8e1peLPpEeMQ86qQm6wEMeXMdtGmNB1lVm4smgmBnVBiEX2QWjtUk3Wd
         LvDmJgcSw+qKUJiKl/ZhD11vp6mhJ+K0K5/PQ7/zOraEoN8kZR1y1lIGVDqINr3om+pV
         3IQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wUmxQ2CKmUZwcrN5uTGmilHnj2rnj+XkjhOUMtgeq20=;
        b=MXiMNUT3H9I9kqognTm/m3ZDLFavGbjUlbki25KG/MjXpo21flP36YnEIQC3Q+JPNi
         R2YxVQRYr9rFW20SX6TMCB541MXOmOUWVG6jeZ6qg6T7FORJgilZxDHhW5ukm8o/eKpC
         1uqkfIspugUQ+45fOLO/AjKJ+oAbNu+qdw4fgHIp8GQeAZJnVKiH8zBLnTXKrw/GP7gD
         Tf5dtbez7j5QgCfA2fDHolNGFTTyXIYRfUQD3NbxEk2YeViUPLFq8q7eshHgDzQayuOH
         WHzm4K4CaH1Cy1KcpbL3N0Ivo69MyGSsaC5m0TVHOF5fFa4r1VwsNLWD6pE8p4uB0i0m
         yPjA==
X-Gm-Message-State: AOAM5322RwA/inuFCZX6uJbe2ppwQLKhOBXHcxfxkgXuPbWg+ebFqKsb
	AB4wC+tXtfM72VUta+pDM2c=
X-Google-Smtp-Source: ABdhPJyA3hAT/SXsiTH53fThRpj8xpD7XnHj0ABuWCmDtywvBXdrguCfCeInuOOSKLyak3B6lG3qsw==
X-Received: by 2002:a05:6000:38b:: with SMTP id u11mr43379975wrf.408.1641310492643;
        Tue, 04 Jan 2022 07:34:52 -0800 (PST)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id 11sm48820119wrz.63.2022.01.04.07.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 07:34:52 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.co.uk, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, kernel@collabora.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v4 1/2] media: hevc: Remove RPS named flags
Date: Tue, 04 Jan 2022 16:34:51 +0100
Message-ID: <2610538.mvXUDI8C0e@kista>
In-Reply-To: <20220104073842.1791639-2-benjamin.gaignard@collabora.com>
References: <20220104073842.1791639-1-benjamin.gaignard@collabora.com> <20220104073842.1791639-2-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Benjamin!

Dne torek, 04. januar 2022 ob 08:38:41 CET je Benjamin Gaignard napisal(a):
> Marking a picture as long-term reference is valid for DPB but not for RPS.
> Change flag name to match with it description in HEVC spec chapiter
> "8.3.2 Decoding process for reference picture set".
> Remove the other unused RPS flags.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


