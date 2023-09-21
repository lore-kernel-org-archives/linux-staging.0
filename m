Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D5C33E9
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:44:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-405361bb93bso5983175e9.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695307455; x=1695912255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWszhBlTWMiwkXqgF1w4h8oNmYkV0xe9wPBMJvnXBgI=;
        b=GP/k2L7E7DDCjGjEWXRZVhR7SrBh2N8Z2k7UPQfIgB1agfhrw4URhVp/hacmT8oHT6
         rJTOZZCjymE2GUhzymHDtVZxrX63SCSHa8nbeo8YZ9TPMYpGDTDHjpu33slEQw7NSByz
         5cAIKG4smnQ8ezwA0e1bPXQIoV9AcmDKFlm3Ok3Z99jOxcDSpkRdy3j4Cfij6biy2/u+
         LmZ9W1VgW5TrJctGTlAtREA1AfuQU+WbxykjzZr1Uy3EK2qLXcUyWm0T3EIn+pQaVErE
         KIKFJ88sQIseNTR337mMyBEZOx/cI+DsfJWujbh/KSkll8esu5ElRpCxrLL8u9DxNwHo
         Bi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307455; x=1695912255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWszhBlTWMiwkXqgF1w4h8oNmYkV0xe9wPBMJvnXBgI=;
        b=ADDOeMIprMO5cYfAIr8/NQjqJB3cHl2AHswA3MjjiSDAF0mbo0Qni1kJp284KqW4od
         7IcmPqBr5temUeYNNFSXP5N2w56sEDAsbbzpnfbMPNAY6nDiB9uGjlQQdJZGXJ/RQMby
         buuVNeCSPdGrz2m4s07mtHxtaI3Emc+dGx389KPHySIqI6oubHO2ZSdacdGY0MpYgFHn
         A0t/H8DPUJ0K8FbNz13lwr/fBTYBiEHQ23KYAUIdpfhsspZf5CxllpqWrzs3e/aurHPW
         i6thxg12dE047wu86Ojik3bwlni3uc3MSjqSXDnMdRRU/T18MnTbGDOx8bk0d5cOb4ED
         XCjA==
X-Gm-Message-State: AOJu0Yy+IHYab67GmiWlXvlyLdHAs17YunZsncKmpAxej4ayM1H7XwCn
	lt7sssxx7aG2hWvCZ/cZ797wxQ==
X-Google-Smtp-Source: AGHT+IEbn5IMsdjtBHEkcUJjQZ6PeFE6mcT6qeW6zrirIQz8hU6m6170Q4EKzy7+2zTNsR6rNCEY9w==
X-Received: by 2002:a05:600c:ad4:b0:3f9:b430:199b with SMTP id c20-20020a05600c0ad400b003f9b430199bmr5382212wmr.15.1695307455234;
        Thu, 21 Sep 2023 07:44:15 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003fe2a40d287sm2125515wmc.1.2023.09.21.07.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:44:14 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	David Lechner <dlechner@baylibre.com>
Subject: [PATCH v2 03/19] staging: iio: resolver: ad2s1210: fix ad2s1210_show_fault
Date: Thu, 21 Sep 2023 09:43:44 -0500
Message-Id: <20230921144400.62380-4-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921144400.62380-1-dlechner@baylibre.com>
References: <20230921144400.62380-1-dlechner@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When reading the fault attribute, an empty string was printed if the
fault register value was non-zero.

This is fixed by checking that the return value is less than zero
instead of not zero.

Also always print two hex digits while we are touching this line.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 06de5823eb8e..84743e31261a 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -393,7 +393,7 @@ static ssize_t ad2s1210_show_fault(struct device *dev,
 	ret = ad2s1210_config_read(st, AD2S1210_REG_FAULT);
 	mutex_unlock(&st->lock);
 
-	return ret ? ret : sprintf(buf, "0x%x\n", ret);
+	return (ret < 0) ? ret : sprintf(buf, "0x%02x\n", ret);
 }
 
 static ssize_t ad2s1210_clear_fault(struct device *dev,
-- 
2.34.1

