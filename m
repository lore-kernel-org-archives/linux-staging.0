Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B74BBA2E
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 14:22:36 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-32157c8e4c7so1034052f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306154; x=1695910954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWszhBlTWMiwkXqgF1w4h8oNmYkV0xe9wPBMJvnXBgI=;
        b=VCVa1g1dY/+sTxHyNk+E7ND/JY3F9uGif0FnVu7N0jK67X1Y5BNxdgxFDt+swTK3om
         FkNU8XiX394lv/Hfj+6WRCL3RMIMiEnssiIKhBc6M26JeFjgBtgmL6scDpQXYPVFKO5p
         Bq4gSrlFjfQ7N9wccAjd1tFQmn6TTR5sgbQzGbZAgvv5H1huMnKAYWpNgyKQgWqFZxAa
         HZv9mhBfcRKz/t+Qj7iNj2+SIjg59CS2vEjnk+y2DRn5j5WJZfWAsoCmLjJVlxSXQjkL
         hK6GPFfrb5FwhaI1pCR/I9m1dlVBGkETMzX+SYZ8iZHSO6BXe27LCc6vEUi9QZc9rr2J
         5oZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306154; x=1695910954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWszhBlTWMiwkXqgF1w4h8oNmYkV0xe9wPBMJvnXBgI=;
        b=vL3gZ9WhSxQmHP4dM1xNBdvD9Z3hMuNH/sria1Ct8NDN3Luw+k8cC2uOAfM0lu4q3C
         HR1ePA5lYNT70K51nTty7WrtBoxJ/5/fUfnMz9DUW5YJ8j1mvvHqSUmXZOQlv7l3fRs0
         NWg9pWq34pfMmxrfvHmQIRUfh0FHGE/gZlPaeP/0CYHNMTBgyF/bYkwO+qGzMKDqwRMn
         6kJYGvsOA6UlhmfdL8M7UOIImzUAOq6AVbYXbwcODppaufolafpM7KazhWixzQUCW10L
         evHmeIkdSXGD+n2ovXbAX6FadGVJqz7jqgY9C5vpiDz2CAOep8IrYWK8voQ5bTsQWMRX
         J4Wg==
X-Gm-Message-State: AOJu0YytwNVIP5wNCwolrY7Jautz12Kn8vNNncdYylnTYrA1n0MS4hHg
	aKummdcpli4jyR7Zt7uZuAzNHQ==
X-Google-Smtp-Source: AGHT+IGfS13FEnLVNfJuIWeRBxS2FNjPxoFFMDKS2aE22dbReCOydRtLnM6n0AwKa1SbUdaYxLP7RA==
X-Received: by 2002:a5d:4a82:0:b0:31f:ec91:39a7 with SMTP id o2-20020a5d4a82000000b0031fec9139a7mr5419502wrq.14.1695306154592;
        Thu, 21 Sep 2023 07:22:34 -0700 (PDT)
Received: from localhost.localdomain (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d4c4b000000b0031fbbe347ebsm1901426wrt.22.2023.09.21.07.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:22:34 -0700 (PDT)
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
Subject: [v2 03/19] staging: iio: resolver: ad2s1210: fix ad2s1210_show_fault
Date: Thu, 21 Sep 2023 09:19:31 -0500
Message-Id: <20230921141947.57784-6-dlechner@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921141947.57784-1-dlechner@baylibre.com>
References: <20230921141947.57784-1-dlechner@baylibre.com>
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

