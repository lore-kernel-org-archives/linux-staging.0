Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A653612E
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 19:21:50 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id y3so6308063ejc.1
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 12:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=kL+H2Xx37KBsv/0YEDfff/qZ7CrxxnzF1gZ71iKSCzs=;
        b=l6c/qvEOw1VPDxsGk/clbSnTu12ZcudT4eqSRKYO8F6wu3/8uW9aqgczXFxE6LCAUK
         C/BQN9fMSO8uBu8vcnkP8WYgrUy8WsFhN6V6C9QtWmDUoFweF+K+jIwoc7PozFjGrJnE
         ep2y2XePXR+0vTY3SOPZZBXAJ6ng0719TvtzZ3Zs55rjyjwIeDRhIsYwwTmONHUJke0I
         /CnLZsVI8ldJC1eC2vSsw+x+fsppNo3SF93zoBcdH00gxd2ee4yWr6aXllthAM+xoMmJ
         C49iLvocpCXQsrAof/HyektkMb2lEs0cbOh20p/ksXUIAdWgTJe1lGOvYDAbWaBrUwUe
         4e4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=kL+H2Xx37KBsv/0YEDfff/qZ7CrxxnzF1gZ71iKSCzs=;
        b=T8h/a2JNnmTNER+lV0i35MDeR0+kSQcJRRsz6UDP1/rcVc5IRUVZ2rHmRSwT2bkkwp
         J22R4un6yOfVn73cyZGZlhYrzAf3duBHIseCaxJal3Gdn8+G1GhxJHJjc/VuxKw1EGvs
         xeGDikHLXL0mcIgZx4lC6pfZH2QS8Jbun8rr9WUxaLsCYmLv1P5S3VsshhaX5AFpI1y6
         6lIQrwUsyJBwmJrnZEqHCQmgh1koqI6w34eH9ytm29ExtZDJeQ74AIbzCjOMxVzm9fQH
         jOAePobKpgIjntt8dNRnxOUAxqdBOncW3+UPepZTTSfPEnSeGu07aUEZyoeqEtj4zn5b
         0hSA==
X-Gm-Message-State: ACgBeo3dZrudJop+/jzwly14jnYLegy3vfVlF5cHZ/5AWsi6gJKGx63y
	tL6J/KFQfVwaIsGdp/Anzg8Hyy1l+Ek=
X-Google-Smtp-Source: AA6agR6lXJibGMBpJFhzJDeTbRXCyULx1MLdO5/d5lJZYIh7yDCqMFBgfnnR9OEwzBu3f1A3qXHrnQ==
X-Received: by 2002:a17:906:9b96:b0:779:dcbe:3a9b with SMTP id dd22-20020a1709069b9600b00779dcbe3a9bmr2952202ejc.607.1662751308851;
        Fri, 09 Sep 2022 12:21:48 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id u16-20020a170906069000b007414152ec4asm632549ejb.163.2022.09.09.12.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 12:21:48 -0700 (PDT)
Date: Fri, 9 Sep 2022 21:21:46 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] staging: rtl8192e: Rename RFWaitCounter
Message-ID: <11acf28a0b9f56dde4fa4fbd74a085cf2fa1c20d.1662402870.git.philipp.g.hortmann@gmail.com>
References: <cover.1662402870.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1662402870.git.philipp.g.hortmann@gmail.com>

Rename variable RFWaitCounter to rf_wait_counter to avoid CamelCase which
is not accepted by checkpatch.pl.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index bc8aca808e99..ee3d0f243463 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -140,7 +140,7 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 	bool action_allowed = false;
 	bool connect_by_ssid = false;
 	enum rt_rf_power_state rt_state;
-	u16			RFWaitCounter = 0;
+	u16 rf_wait_counter = 0;
 	unsigned long flag;
 
 	while (true) {
@@ -149,10 +149,10 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 			spin_unlock_irqrestore(&priv->rf_ps_lock, flag);
 
 			while (priv->RFChangeInProgress) {
-				RFWaitCounter++;
+				rf_wait_counter++;
 				mdelay(1);
 
-				if (RFWaitCounter > 100) {
+				if (rf_wait_counter > 100) {
 					netdev_warn(dev,
 						    "%s(): Timeout waiting for RF change.\n",
 						    __func__);
-- 
2.37.2

