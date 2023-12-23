Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C8E6FB0
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 07:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZqnYbbm"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-35fe456b94cso3925325ab.3
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 23:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703315526; x=1703920326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gdq20GqT0V3FaSsYb4r80A7ENvWSSP5EMXwhIHB4x9c=;
        b=LZqnYbbmijXB4gePBzPrhcFbXG8h8IfyNcP4ssEqfEQ3J1DnJ9c5Nrqj+yxuzCz1iP
         Ar1glSc22b/70EVniOL9lKuK5LU4vWKYoMUtgg/SOOnys6LdruXqRdySrem1A8lrcf9f
         A5eIt2Vak/lszFw0dJ3J/Jwrq2GPvcqQa9jm9tVrgmmY0a3CkRkioxuTRioOkWryJjYY
         CIC9KVLH7pMIz7JHK9ed4RX5xxdMEdzgn++ZR0sV8UXxsRhhOAUz6sun2KgYiCnxnTnI
         +5NsvAeeUTrzT+ykyfeEMx/LfzhOE1DlCBxzhp4IWAO/IlgjKcYnarqk3BuyVfsJm/Qk
         0E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703315526; x=1703920326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdq20GqT0V3FaSsYb4r80A7ENvWSSP5EMXwhIHB4x9c=;
        b=EGkwe5AhL8a0rM1Xup/i9n1VJbpD4P6XYpF64hvVq6m5HZmpTMudS8unsZply7qRYd
         rLg6UtzSDxxkDA4aMHvXUZ9ItEqhUtPj2d3DUfGAbi1VCMoBWUSa82hZ66c0t3m4dMZs
         V7o6lNDUMleqqv9FF2svaymjNfFnD6Zo5lBIBlrJlrx63rgW77bu/iEFlLGTs5yhQ2MO
         h4hqJJA+4eW4s6n2N+obwK2A2xCLUrdkRZcPOUKLtJZ0sb2Mo61ceA75qTt4ikdGbqSn
         dP9wioY7Y7LT2xH7EqkSs/Qhcv/FjrcgBtjhG1pHcRpWCAaLZcAiWOG9gc+7jpDShrR6
         TwVA==
X-Gm-Message-State: AOJu0YxvyTOtdVExGBYe/oImGWhe2H5SJoIbtTRuzuc/sZ8ftAYolBDP
	K8Xk+V0cLIwgvjx6KkRwsQ0=
X-Google-Smtp-Source: AGHT+IHgYkJh+MntoZJwAFW4c/GlkRitASejMY+WgAxbCAxYviF91k2BISccQHbOGesv8LalkuMPKA==
X-Received: by 2002:a05:6e02:338f:b0:35f:960e:c030 with SMTP id bn15-20020a056e02338f00b0035f960ec030mr3894872ilb.48.1703315526642;
        Fri, 22 Dec 2023 23:12:06 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902d3d300b001d3eb987bb6sm4492132plb.149.2023.12.22.23.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 23:12:06 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci/runtime/queue/src: Fix spelling mistakes in queue.c
Date: Sat, 23 Dec 2023 12:56:57 +0545
Message-Id: <20231223071157.81082-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in queue.c as below:

'''
./runtime/queue/src/queue.c:126: uncessary ==> unnecessary
./runtime/queue/src/queue.c:183: uncessary ==> unnecessary
'''
This patch fixes these spelling mistakes.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index 2f1c2df59f71..2c6c8fffc4e2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -123,7 +123,7 @@ int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 
 		/* c. Store the queue object */
 		/* Set only fields requiring update with
-		 * valid value. Avoids uncessary calls
+		 * valid value. Avoids unnecessary calls
 		 * to load/store functions
 		 */
 		ignore_desc_flags = QUEUE_IGNORE_SIZE_START_STEP_FLAGS;
@@ -180,7 +180,7 @@ int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 
 		/* c. Store the queue object */
 		/* Set only fields requiring update with
-		 * valid value. Avoids uncessary calls
+		 * valid value. Avoids unnecessary calls
 		 * to load/store functions
 		 */
 		ignore_desc_flags = QUEUE_IGNORE_SIZE_END_STEP_FLAGS;
-- 
2.39.2 (Apple Git-143)

