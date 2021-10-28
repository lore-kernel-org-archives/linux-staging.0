Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEE02C81
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 10:36:06 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id b194-20020a1c1bcb000000b0032cd7b47853so3497086wmb.5
        for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Qso+1ON4rmrX1jJtTceQDXho/IqTPAJlT6pz5AB0mo=;
        b=JuDRzGWXJdwZnwyw9y3XuVYfdz9VmYyIut/q4Myqdp3crHDY9XEp/eNxGhslq4+exG
         4inLg7hkdi2hYEmQ0nicHhrvVC5TagslJf4PyfHnVkYeiYbyvO/sKmepIpC6EW6vrWyz
         iiwmEkT5J4MCTO5t83XOV8Ew1gr8w1Hi/IOh2GKNcWs6r+Gl6TecOn/w/psoQZoMVs9n
         7zvXFAzoPdxxUfqEMmsfk/VNe6u+hYhV7RlCcuUUOpW4ft6zogpfUspYUPAXh3MkAEsw
         x1BKCw6bmTyahZPmdz9P/ZMUdciHFLyenLHP4mOediicetow322D23uwFmDQ3E8x8hNz
         lpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Qso+1ON4rmrX1jJtTceQDXho/IqTPAJlT6pz5AB0mo=;
        b=VkIAXxFmPUdEYTO54txfl/lSGT8CrLiZaSW6H0MtowTUSdjaneASdqt9IujGovEd8N
         wpxDgWfC0fZ92xOI3fYkinM0M1gD9zDG+GUozsxSu0v5uKqwNw25lw6uSwwCur+smWcP
         zMdBuddQyx8fooDLlFE1rehnponh5g/lCKH9nGaGHFBtlE5a5cAf9RrG8aGolMRiiuNX
         3kYekozm71LD64v+3XdA0T+kgw9S2SRIm7eQuJlYfN1SQsJQerAnTCRIuLOjhCClumwd
         YjSduPkQRt/mZjf58gUaLCxUJ+Zc+k8QcZvIEzM4hNNFaXqGDP4fdNhuBst0hdOCzrqn
         81Iw==
X-Gm-Message-State: AOAM530QOA0rH6mx+hFBBrHfSk+pMLsyT/+UVYaBMIy2fGCp+5ouEEyI
	z5eJTxHrt8f0M4dwhk4swQo=
X-Google-Smtp-Source: ABdhPJzVmmyk3rICEmdjGQDKZco2RAgx2FID/jxIj3Qw0fF2RVVSg+bXEv/Q2llkGSua0Y/aboa5Uw==
X-Received: by 2002:a05:600c:ac1:: with SMTP id c1mr3464003wmr.99.1635417364756;
        Thu, 28 Oct 2021 03:36:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id 13sm3768083wrz.38.2021.10.28.03.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 03:36:04 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 7/7] staging: vt6655: Update comment for `rf_write_wake_prog_syn`
Date: Thu, 28 Oct 2021 11:35:37 +0100
Message-Id: <353aa2ea26c64adc1d591a1fabdedd3d27cce3d5.1635415820.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1635415820.git.karolinadrobnik@gmail.com>
References: <cover.1635415820.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the function description to include the actual parameters.
Update the comment on the return type.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 7caac1b44a68..fb31ec70c019 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -669,11 +669,11 @@ bool RFbSelectChannel(struct vnt_private *priv, unsigned char byRFType,
  *
  * Parameters:
  *  In:
- *      iobase      - I/O base address
- *      channel     - channel number
- *      bySleepCnt  - SleepProgSyn count
+ *      priv        - Device Structure
+ *      rf_type     - RF type
+ *      channel     - Channel number
  *
- * Return Value: None.
+ * Return Value: true if succeeded; false if failed.
  *
  */
 bool rf_write_wake_prog_syn(struct vnt_private *priv, unsigned char rf_type,
-- 
2.30.2

