Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F57C8E8
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 20:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBCG/PNn"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b512dd7d5bso875679b6e.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 13:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698353369; x=1698958169; darn=lists.linux.dev;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJjai3VGOwsHwC0U2O9UgtGT7zp2nRk2Qh6Ik0LTrGM=;
        b=EBCG/PNnVKrn1LpUoygzOin1SZSZ3OVYDOoPNCEltKrv9uEofRRZbWf8sntrvjEVGO
         6+sBQcQ0gwxXwAoU1OvebQ4uhO1Mvd1gJxmjOU2FxwwFFm9rnMo7Ew/yUeeP+vTW3fB4
         doKfblvWv1Bq5ysaMGiJLrfSHikDAdu+Edx3uLI7LoWRzDxjdvGgoMIPKM7lY2zCgtHr
         3B0mQQ5qiT4Z032t8r4LqmGalZbhbiQa6Nr6S/c2TfrPvaNOuAFXecfzK4OJoC3pOX8N
         sId/kAKkR0o7biJNqHH/WD8OBZSFxv1i5sfehnGTNofVvcUyJioNqM0kYaWgyLu3oqyr
         D9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698353369; x=1698958169;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJjai3VGOwsHwC0U2O9UgtGT7zp2nRk2Qh6Ik0LTrGM=;
        b=onqNJFBzm54Pe25wdR2Qn8NI4qghidm2aRfQe2LZgOpaWzkU+ZGw8V7AeUfTxuHowv
         898MwDn6V9pL2GTegbgP64/Dc+rpOdnb4dT46t5iNTOSIjtquxdFXXIFFu7Q+JA6xHFn
         tgo6N4I5Ee4euioU6QKBeTJegij9nBprj8eJ5RsKOYHx58CjPgjo3sKbsh2RKnuN/Skt
         THkOTvXb40FjlHpObM5hVwDk2hjSnqPBFTDYl+9qXyTNGYa4Dz9K9AFy5z0wfbycpBXp
         llXLR4b6kAbA1KnJrCQGqBXr2+4zaBihVu6JZHbfcRQvntliZ6eC/Bv/uxBwd8bm1jjh
         vBNA==
X-Gm-Message-State: AOJu0Yz2Ki3yT35bY5w02y38Nmi4+nrNXaaCDPZuElNd3jRjU5Nr7c2H
	nleUVdpybRLQRbTJpPfoqt4=
X-Google-Smtp-Source: AGHT+IEf9lIE8p3xJjhCUgB6e5TmFDWolM7ODCud1kszkEoiDHo4k6JopL/fHLT4lbeSkJ15q2V61Q==
X-Received: by 2002:a54:418f:0:b0:3b2:d9d8:4039 with SMTP id 15-20020a54418f000000b003b2d9d84039mr581113oiy.24.1698353368981;
        Thu, 26 Oct 2023 13:49:28 -0700 (PDT)
Received: from ?IPV6:2a02:3100:95bf:4b00:95bb:38e6:4df0:e5c4? (dynamic-2a02-3100-95bf-4b00-95bb-38e6-4df0-e5c4.310.pool.telefonica.de. [2a02:3100:95bf:4b00:95bb:38e6:4df0:e5c4])
        by smtp.googlemail.com with ESMTPSA id bh16-20020a056808181000b003b2e536a96dsm26178oib.24.2023.10.26.13.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 13:49:28 -0700 (PDT)
Message-ID: <da3070d9-e016-4167-843f-a08d5b2dc1fe@gmail.com>
Date: Thu, 26 Oct 2023 22:49:21 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jens Frederich <jfrederich@gmail.com>,
 Jon Nettleton <jon.nettleton@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wolfram Sang <wsa@kernel.org>
Cc: linux-staging@lists.linux.dev,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] staging: olpc_dcon: Remove I2C_CLASS_DDC support
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

olpc_dcon is the only remaining i2c client device driver declaring
I2C_CLASS_DDC support after the legacy eeprom driver has been removed.

olpc_dcon is only used on olpc devices, connected to an i2c adapter
driven by scx200_acb. This adapter driver declares support for
I2C_CLASS_HWMON and I2C_CLASS_SPD. Therefore we can safely drop
I2C_CLASS_DDC support in olpc_dcon.

That's the last step before I2C_CLASS_DDC can be removed in general.

This patch is solely based on documentation, and I don't have an olpc
device for testing. Therefore some testing would be appreciated before
patch is applied.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/staging/olpc_dcon/olpc_dcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/olpc_dcon/olpc_dcon.c b/drivers/staging/olpc_dcon/olpc_dcon.c
index d5271eac1..08ec3aae9 100644
--- a/drivers/staging/olpc_dcon/olpc_dcon.c
+++ b/drivers/staging/olpc_dcon/olpc_dcon.c
@@ -777,7 +777,7 @@ static struct i2c_driver dcon_driver = {
 		.name	= "olpc_dcon",
 		.pm = &dcon_pm_ops,
 	},
-	.class = I2C_CLASS_DDC | I2C_CLASS_HWMON,
+	.class = I2C_CLASS_HWMON,
 	.id_table = dcon_idtable,
 	.probe = dcon_probe,
 	.remove = dcon_remove,
-- 
2.42.0

