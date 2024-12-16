Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA22126BF7
	for <linux-staging@lists.linux.dev>; Mon, 16 Dec 2024 17:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734368770; cv=none; b=Ya5farmsJMav8LemV+fWWYhjNgPFl9EBEsfsOAIKcMQBBKz8ip6OoKqDMWiB/1FUzf/2xAGOWWT4ONNXPQ/e31mRED1RWwt+bCl56gWn0RkoNIqL96in0axnj6aXDbcGa4uDuRKOEDaOSoCM2S0KzoRMJfGc27ES4oEI737hCqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734368770; c=relaxed/simple;
	bh=MAPGnb/rDFCyKmZ9vIMKTvsIFAHxT2Z/QWpxoKCvz0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAT1MEvygzdZuXtTaVLWA4TggvPAD3KcYugjGzE3FaF2zI+/ARNir9pesDveDd4+QliuDy8ANTx8dO61AuSknjNcSFzqfY70hm4i+AgRUc34OvDf+uKuO2weCEr5nc5r/p7tx6PyY4YZsEnTiYzYyVF8pkOwCj/vvEUgYorvtF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxYH7Q/S; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxYH7Q/S"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6dcc42b5e30so44183406d6.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Dec 2024 09:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734368768; x=1734973568; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jSFhnXUL93LSseKbQNDD/2FtEWDaPkw68EjTeRJDoTc=;
        b=lxYH7Q/SfUZ2pXJ5RIxFsAjRzO8Ou2YbjEyOIFbMYdrWaR+sGHuPGnxiUs/QWdvN8C
         UAGrp4vd2AnhwUUkMoejMxKj04EO430GSw0ckSxbeuikSDnuZpGhmyAGwt9bfxmrto13
         49RahPtseSdhTNr6WdUjq3bGR5hRgRnzudrKlbj7aL07quY2dEr9F2CiILJgYJIUGD+J
         FlbDVH78uQvSI0tCnR73W8pJFqK5Qedacq0hpS1Fv3GmP+s2pv3SvrWqmp1Cc7rVoIkW
         xPF8e/bmm+SpcpJRtoXvZrb3+20GhqbPUim5KrdVB6L5hlblr9+swla8Hreg4MKLYZAZ
         2WOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734368768; x=1734973568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSFhnXUL93LSseKbQNDD/2FtEWDaPkw68EjTeRJDoTc=;
        b=p8wgzO3irkNdRVWt+X5iVgJ02FmcHQoUP4sDhPr0Ca1fbDvlKX4U73TQkFifibIe1u
         Xb5KIf7a4cFy1reFZ3xpjlLik0i1gJW7t/W7zYr395cx5HROcQH0AKcte/SZojsieCyT
         6g/UkbtodtmOdAIa+obxuetj9VtaioK8w2w93hn8wV/vsoE3YUZAiQBZ+fm9r8QuAwr6
         /+zVH1uXmI5GlvD0EOtsTubOuTFJdtuP5IYYSNnlqaWJx3O5YeqiifHLcmX7FRhRdR9R
         hRGh06pv3ML+3Cwk7GfL1ZdJZvogk/BSjdfwxlNQORrKeRCpDgOVka7qimCoEPEsLZ6I
         byvg==
X-Forwarded-Encrypted: i=1; AJvYcCU7eU1m0PQh+mArXPyjEZowQ6dNNPbjFXZL9ORvAqSO7smO5AWwpGBbH4zGvut9+iGVHjxEQ5Xj8327cIen@lists.linux.dev
X-Gm-Message-State: AOJu0YyQZBE9Devo93jXJT/xzmZwsXS9lSez7oFWgEAa64yfVqerSW+W
	ufIWBxFQ/P2jRcWEVHpsdvRJZ3ux3nzk1gdc4HyxRuDsYFemeWOBvDhIAsN5PX6pYgNSbQirV5e
	LOjBE7iwycqPGoy2lWkKYa5Yib+Q=
X-Gm-Gg: ASbGncsrLkGQpIZsPb5lyJ/W9LYL6hUTlx5fpdR7FQq+WEM72joX0BAqokEVGSSWscf
	A8cCIHHn6xc54kyfJTRBCdinNtP3iw2EwFfkq
X-Google-Smtp-Source: AGHT+IHBoDS11FnEtYORWaxlzaV0A0BY3JNZi3ZxwXrZVmFnolu33hrWl/iZcI7cga2m/PVWBJFxSnt3AzKa+9Hm9UA=
X-Received: by 2002:ad4:5d69:0:b0:6d8:8667:c6c2 with SMTP id
 6a1803df08f44-6dc8ca57574mr273690766d6.18.1734368768068; Mon, 16 Dec 2024
 09:06:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241216154750.1193584-1-laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20241216154750.1193584-1-laurentiu.palcu@oss.nxp.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 16 Dec 2024 18:05:51 +0100
Message-ID: <CAPybu_2cXu0U=nJnxR+biK1ovXsq+pbcBYVV-C6ZwjWCrtsqzg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: max96712: fix kernel oops when removing module
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"

Hi

You probably want to add:
diff --git a/drivers/staging/media/max96712/max96712.c
b/drivers/staging/media/max96712/max96712.c
index ede02e8c891c..a47f18d57325 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -418,7 +418,6 @@ static int max96712_probe(struct i2c_client *client)
        priv->info = of_device_get_match_data(&client->dev);

        priv->client = client;
-       i2c_set_clientdata(client, priv);

        priv->regmap = devm_regmap_init_i2c(client, &max96712_i2c_regmap);
        if (IS_ERR(priv->regmap))

That way it will be more difficult to make the same mistake again.

Regards!
