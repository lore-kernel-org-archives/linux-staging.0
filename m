Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113C51FB1
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 03:34:24 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id h132so5351094pgc.10
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 20:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=oUvqYsnCKAObMxNxAaIFanlsa80QzweW9pqDDzbQrVs=;
        b=kfOW+D31Pn7OedYvv/Sot9KuXUHCw02n10rSv9HFMVKbx4iRwxChWIYus1WDfLoddN
         qPOQmr3qizEo7uSGI86Y0iL6xZENeoEzZKhI+WcaLC5e03uuk8tu5JMUUz2d+S8yTkXk
         YGZM/Mg+Poqc8afODNOZVPh54zLW9Fnqwr4cx1gHj0S00HArL2rSadNb+Ma7LuoX1YCf
         ShEXPs5NIThUjT7OlTkPPfn7cBcRjkcwNTGedkZGnYBt8IH4hETlRpsAk1pYzGmCkUTA
         wMId5CUnYEp0O9pf7AA3VhPtLvp6MgFim/uzQySVII4Zxwl26uhr8N+NVZBxRJ9PR77o
         iCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=oUvqYsnCKAObMxNxAaIFanlsa80QzweW9pqDDzbQrVs=;
        b=wEnl+DHxjUKp4iJ/+WDlsxb7h4WPRnxrCd8Pb2sJRMORaqoy0gu9D4KKj0Gvy/9XiN
         fskQLX4TwtibLAIxNrr6JfuQW0pQ1pXMZEJnHHXU1fF7R2WLOL034hKan3Z2+iPfDucH
         W/JQxmqx0q8LAh2ILCAKXBowd+wrrrHGNG0gmKDFDM7OWDuj3OTVe+SYdVhhAg7OWIER
         /OHivOPdO72TaHl4Z27BjzG+MkOAXGQoOPbn/RblrFtVDV1GAvWJxqfQmrcsX0YAGnD0
         emyA6GicVbfEXwv4LofmkPVIYEeZKyEqJxMsoe5sJXx01r7F9puhc/RkKsgMevF9dDUh
         ev5A==
X-Gm-Message-State: AJIora8kiN2l3EWO0dkG3TzGebSyshGKAjX08nNOAPiMaasoyhCbfno0
	PeG6pxnRrlhC65SITytqKHo=
X-Google-Smtp-Source: AGRyM1uwweumNEcoszwdAT6GJgqFwKPFuay28xWDobwiRhtieZ5DjrnnYUTmBpVmNKt5jLd3cRzr+w==
X-Received: by 2002:a63:1ce:0:b0:41a:f362:8708 with SMTP id 197-20020a6301ce000000b0041af3628708mr5244504pgb.571.1659152064413;
        Fri, 29 Jul 2022 20:34:24 -0700 (PDT)
Received: from tong-desktop.local ([2600:1700:3ec7:421f:f0d:9a23:40c8:9423])
        by smtp.googlemail.com with ESMTPSA id h3-20020a170902f54300b0016a3248376esm4441555plf.181.2022.07.29.20.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 20:34:24 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tong Zhang <ztong0001@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Colin Ian King <colin.king@intel.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 2/4] staging: rtl8192u: remove unnecessary cast
Date: Fri, 29 Jul 2022 20:33:22 -0700
Message-Id: <20220730033335.74153-3-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YuOLybUZ8cBWntY/@kroah.com>
References: <YuOLybUZ8cBWntY/@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cast is not needed when calling ieee80211_priv, so remove them.
No functional change in this commit.

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_procfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_procfs.c b/drivers/staging/rtl8192u/r8192U_procfs.c
index 69cbafceecfe..d6f8401526c5 100644
--- a/drivers/staging/rtl8192u/r8192U_procfs.c
+++ b/drivers/staging/rtl8192u/r8192U_procfs.c
@@ -10,7 +10,7 @@ static struct proc_dir_entry *rtl8192_proc;
 static int __maybe_unused proc_get_stats_ap(struct seq_file *m, void *v)
 {
 	struct net_device *dev = m->private;
-	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
+	struct r8192_priv *priv = ieee80211_priv(dev);
 	struct ieee80211_device *ieee = priv->ieee80211;
 	struct ieee80211_network *target;
 
@@ -70,7 +70,7 @@ static int __maybe_unused proc_get_registers(struct seq_file *m, void *v)
 static int __maybe_unused proc_get_stats_tx(struct seq_file *m, void *v)
 {
 	struct net_device *dev = m->private;
-	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
+	struct r8192_priv *priv = ieee80211_priv(dev);
 
 	seq_printf(m,
 		   "TX VI priority ok int: %lu\n"
@@ -129,7 +129,7 @@ static int __maybe_unused proc_get_stats_tx(struct seq_file *m, void *v)
 static int __maybe_unused proc_get_stats_rx(struct seq_file *m, void *v)
 {
 	struct net_device *dev = m->private;
-	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
+	struct r8192_priv *priv = ieee80211_priv(dev);
 
 	seq_printf(m,
 		   "RX packets: %lu\n"
-- 
2.25.1

