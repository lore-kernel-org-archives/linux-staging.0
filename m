Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80232F80
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 15:26:20 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id w19so2243989pfn.12
        for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D4WwsAKtr4dF9+Ms/eC0nBtcrq0b032Vv8oUlzQvzzA=;
        b=Z0PAghmEn1knBUV5Vd2g2vijWdO9zSqoDihtnDOpVnbRxXJiGpyUa/0jt6TEISEWrP
         upIELCrdRCwQMyLNzJw1M7jaeCiIXjmiVA0K4BLMmPvq9i0a3TGYG2+ZVDiJ7ngm7Wqh
         BD8YGV+K+Pg6Ai8JWgFHhNO2aqqBBy3ziDqcLicK3fGCMfVH8iDCeY7+Rt+Dg+XT9NOO
         PJurXJYIY36xqbg9GVPAxd3a/O/J/doBF0oPE9Gpt1VaEyc6XebH+od4j4GxKAN73flu
         5AOk4zWfjO3+qb5MWEbBPUD9suaFE+1Th76mnDHw5xelZKzcKTV1eWjASuD46WH8Ly+g
         Wbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D4WwsAKtr4dF9+Ms/eC0nBtcrq0b032Vv8oUlzQvzzA=;
        b=tZzMa8I6kxgHlANKsUhqh79LPC47eY9VNvYcdOA976p5remzj+qNt/XpCkcTiqMDAo
         WW/xC3kYV8EJ8UiTxRtVimYmZpiYnfqAemNS/gsaZY7CWiZW/2Jls0ktukrIXWqMqXwH
         r8Wj023/rOE7E/tVuLxn+ZJTc58rMPukv/fT/7ppSh04Fdwwjj9RbYgiYGQhux7tZYf2
         GarBfMw4lAg8OmTVZucVe2OeXTiARdrYB6sJB3kpiYrhTlRn3B/xSSP7YP2m14jBpIYE
         us4CoOIl+nT2qaqNBwJ0Wkq8AvmEAO+KAOnYBhhwbnq5SKfYI4edUL1shIg8aHzEgj6O
         O0LQ==
X-Gm-Message-State: AOAM530jeG7XNvdVB3c04n2TGseGiME9kLKyYcA6mMxnoL27lu6gkVk2
	b5kR5RWOLaMNGigCgVMjieI=
X-Google-Smtp-Source: ABdhPJw/aGnPY4VMPRv6OEv4pOtESPJh6OCzzp/mMhmOw/43uqM4mM2bChafqgpXKQ+C82lZzAM3cQ==
X-Received: by 2002:aa7:96b5:0:b0:447:96bd:e467 with SMTP id g21-20020aa796b5000000b0044796bde467mr441487pfk.41.1632929180321;
        Wed, 29 Sep 2021 08:26:20 -0700 (PDT)
Received: from localhost.localdomain ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id k22sm174647pfi.149.2021.09.29.08.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 08:26:20 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sidong Yang <realwakka@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: print rf69 debug message more detail
Date: Wed, 29 Sep 2021 16:26:11 +0100
Message-Id: <20210929152611.17998-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When pi433 failed for rf69 configuration, Debug message should help for
finding which value is incorrect. But it's hard to know because it just
prints "illegal value". This patch make print message more detail.
---
 drivers/staging/pi433/rf69.c | 38 ++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 7d86bb8be245..dc047bcdf44b 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -113,7 +113,7 @@ int rf69_set_mode(struct spi_device *spi, enum mode mode)
 	};
 
 	if (unlikely(mode >= ARRAY_SIZE(mode_map))) {
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal mode %u", mode);
 		return -EINVAL;
 	}
 
@@ -143,7 +143,7 @@ int rf69_set_modulation(struct spi_device *spi, enum modulation modulation)
 	};
 
 	if (unlikely(modulation >= ARRAY_SIZE(modulation_map))) {
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal modulation %u", modulation);
 		return -EINVAL;
 	}
 
@@ -191,7 +191,7 @@ int rf69_set_modulation_shaping(struct spi_device *spi,
 						   MASK_DATAMODUL_MODULATION_SHAPE,
 						   DATAMODUL_MODULATION_SHAPE_0_3);
 		default:
-			dev_dbg(&spi->dev, "set: illegal input param");
+			dev_dbg(&spi->dev, "set: illegal mod shaping for FSK %u", mod_shaping);
 			return -EINVAL;
 		}
 	case OOK:
@@ -209,7 +209,7 @@ int rf69_set_modulation_shaping(struct spi_device *spi,
 						   MASK_DATAMODUL_MODULATION_SHAPE,
 						   DATAMODUL_MODULATION_SHAPE_2BR);
 		default:
-			dev_dbg(&spi->dev, "set: illegal input param");
+			dev_dbg(&spi->dev, "set: illegal mod shaping for OOK %u", mod_shaping);
 			return -EINVAL;
 		}
 	default:
@@ -392,7 +392,7 @@ int rf69_set_output_power_level(struct spi_device *spi, u8 power_level)
 	return rf69_read_mod_write(spi, REG_PALEVEL, MASK_PALEVEL_OUTPUT_POWER,
 				   power_level);
 failed:
-	dev_dbg(&spi->dev, "set: illegal input param");
+	dev_dbg(&spi->dev, "set: illegal power level %u", power_level);
 	return -EINVAL;
 }
 
@@ -417,7 +417,7 @@ int rf69_set_pa_ramp(struct spi_device *spi, enum pa_ramp pa_ramp)
 	};
 
 	if (unlikely(pa_ramp >= ARRAY_SIZE(pa_ramp_map))) {
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal pa_ramp %u", pa_ramp);
 		return -EINVAL;
 	}
 
@@ -433,7 +433,7 @@ int rf69_set_antenna_impedance(struct spi_device *spi,
 	case two_hundred_ohm:
 		return rf69_set_bit(spi, REG_LNA, MASK_LNA_ZIN);
 	default:
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal antenna impedance %u", antenna_impedance);
 		return -EINVAL;
 	}
 }
@@ -451,7 +451,7 @@ int rf69_set_lna_gain(struct spi_device *spi, enum lna_gain lna_gain)
 	};
 
 	if (unlikely(lna_gain >= ARRAY_SIZE(lna_gain_map))) {
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal lna gain %u", lna_gain);
 		return -EINVAL;
 	}
 
@@ -466,14 +466,14 @@ static int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg,
 
 	// check value for mantisse and exponent
 	if (exponent > 7) {
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal bandwidth exponent %u", exponent);
 		return -EINVAL;
 	}
 
 	if ((mantisse != mantisse16) &&
 	    (mantisse != mantisse20) &&
 	    (mantisse != mantisse24)) {
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal bandwidth mantisse %u", mantisse);
 		return -EINVAL;
 	}
 
@@ -531,7 +531,7 @@ int rf69_set_ook_threshold_dec(struct spi_device *spi,
 	};
 
 	if (unlikely(threshold_decrement >= ARRAY_SIZE(td_map))) {
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal OOK threshold decrement %u", threshold_decrement);
 		return -EINVAL;
 	}
 
@@ -578,7 +578,7 @@ int rf69_set_dio_mapping(struct spi_device *spi, u8 dio_number, u8 value)
 		dio_addr = REG_DIOMAPPING2;
 		break;
 	default:
-	dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal dio number %u", dio_number);
 		return -EINVAL;
 	}
 
@@ -681,7 +681,7 @@ int rf69_set_fifo_fill_condition(struct spi_device *spi,
 		return rf69_clear_bit(spi, REG_SYNC_CONFIG,
 				      MASK_SYNC_CONFIG_FIFO_FILL_CONDITION);
 	default:
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal fifo fill condition %u", fifo_fill_condition);
 		return -EINVAL;
 	}
 }
@@ -690,7 +690,7 @@ int rf69_set_sync_size(struct spi_device *spi, u8 sync_size)
 {
 	// check input value
 	if (sync_size > 0x07) {
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal sync size %u", sync_size);
 		return -EINVAL;
 	}
 
@@ -727,7 +727,7 @@ int rf69_set_packet_format(struct spi_device *spi,
 		return rf69_clear_bit(spi, REG_PACKETCONFIG1,
 				      MASK_PACKETCONFIG1_PACKET_FORMAT_VARIABLE);
 	default:
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal packet format %u", packet_format);
 		return -EINVAL;
 	}
 }
@@ -753,7 +753,7 @@ int rf69_set_address_filtering(struct spi_device *spi,
 	};
 
 	if (unlikely(address_filtering >= ARRAY_SIZE(af_map))) {
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal address filtering %u", address_filtering);
 		return -EINVAL;
 	}
 
@@ -788,7 +788,7 @@ int rf69_set_tx_start_condition(struct spi_device *spi,
 		return rf69_set_bit(spi, REG_FIFO_THRESH,
 				    MASK_FIFO_THRESH_TXSTART);
 	default:
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal tx start condition %u", tx_start_condition);
 		return -EINVAL;
 	}
 }
@@ -799,7 +799,7 @@ int rf69_set_fifo_threshold(struct spi_device *spi, u8 threshold)
 
 	/* check input value */
 	if (threshold & 0x80) {
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal fifo threshold %u", threshold);
 		return -EINVAL;
 	}
 
@@ -826,7 +826,7 @@ int rf69_set_dagc(struct spi_device *spi, enum dagc dagc)
 	};
 
 	if (unlikely(dagc >= ARRAY_SIZE(dagc_map))) {
-		dev_dbg(&spi->dev, "set: illegal input param");
+		dev_dbg(&spi->dev, "set: illegal dagc %u", dagc);
 		return -EINVAL;
 	}
 
-- 
2.20.1

