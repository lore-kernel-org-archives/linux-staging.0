Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821B01840;
	Tue, 12 Apr 2022 01:50:36 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id z15so8911017qtj.13;
        Mon, 11 Apr 2022 18:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0zgX0lRBSeUYGjy4/2KaVjVU1Nii6uaJF61nZ62EHQo=;
        b=ALgJryFJ8KuYRsLAi1C70WILaGJYBJhDByCkA4L1ffkmDCQ/ZcrlTh7vQsszZdUX9o
         tpDYK5/Bl7zAg9xOpA/+n1JSC/YhUIL83iiBcKEtVOlvRZZGuNfD0QM3biDB0YQUqt/e
         q2kTTCfXhdiIagqLBL8nroWc/e7+9wyvqvTqEwVkfKvsPBKFlTI26gP+mFCkuOMwgwb/
         tsbhTwcL+tE5V4KpcWj7r+B5T7Ocwk2aKDVRlKZfLstP+CkTxl/gO9wxp41K9fPIfd44
         SHMI5MfC4wFxdQeXE84aVPZLm7YaYklDFHx32VoPtEl06EIkyB/M89AjY30pDhgfkeX1
         Ytjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0zgX0lRBSeUYGjy4/2KaVjVU1Nii6uaJF61nZ62EHQo=;
        b=5xzQ+DziieslyqktMYEaqtcZxElUCeTQ1+LaU/tO6D2WZVDeBRFqA97Jve/E7ck/rE
         tGjR813uJp0WalixU1Y6jOkV2k1ObrphAWoB1Bix2fXz/aGkKgxzmCCAbtAzu1tV0/Uw
         aI8Gu/wEOxOJFQG2AowQWclGIrgZEqz9RZMoOuYeQksXbJGuRT0PjKM341daW8E3QjU2
         +8eHyJe2AK8+uasZo+CQYgIWnCuwn+f1F7SIGuKbIWpz/UDivp4D3Uct6IsctIuHhCIO
         iAwWQ6W6QO1oEZ4cpRGd77zY3BL36eNZBvcdlQrRiQ7IVn+e4jkRn5Aj4zIUbiTMPFa1
         JC/w==
X-Gm-Message-State: AOAM533BHP9FTsftdYPnLZrenQKAzV9rF4ampKUMgJRGzjSiIn/lkqsd
	0bq/pCvVcdkPAbbPBCSJbQOzLbC0h9mfft88
X-Google-Smtp-Source: ABdhPJyVeA6zt+aob1XQm4uc32KoNAGhowGFGSAdjfqXLMJZMqwhQg9FsbA9zzbKZLBucKwnc+oolA==
X-Received: by 2002:ac8:688c:0:b0:2f0:4bcd:1e46 with SMTP id m12-20020ac8688c000000b002f04bcd1e46mr1159320qtq.577.1649728235524;
        Mon, 11 Apr 2022 18:50:35 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:50fb:900e:25ab:983d:ac30:58b5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac85cd0000000b002e1ed82f1e5sm29556305qta.75.2022.04.11.18.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 18:50:35 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH 2/2] staging: greybus: remove return in an empty void function
Date: Mon, 11 Apr 2022 21:50:22 -0400
Message-Id: <eaf51ac31d264179298cb24c91f05a14e3651bda.1649712572.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649712572.git.jhpark1013@gmail.com>
References: <cover.1649712572.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue found by checkpatch:
WARNING: void function return statements are not generally useful

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 0f50d1e51e2c..3e3a16568def 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
 static void gbcodec_remove(struct snd_soc_component *comp)
 {
 	/* Empty function for now */
-	return;
 }
 
 static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
-- 
2.25.1

