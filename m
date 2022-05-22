Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F32333E3
	for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 19:49:04 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id ck4so20486243ejb.8
        for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 12:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FNHzluLfUaxr3+BQTAbtyKvp8fT7fI8o/97d48qjwEY=;
        b=Gc6PP9O5kmtr7+f6CYWJFeV/nPQoLRNIJbhOqwTHyP+8+noBd6fliNCRQ8SB9dCMbN
         OHh5AR76iTS9vIAgAVw1jYYSzgc+9YihBssc/uHDTdikm08rnyZcaoqDJF6hyqzL3X9/
         PMIsG1Br8Lu3OO6Fugm7lzo2Ec+EvGz+BJK5sPyPDV6VTCgWwp6669geA1OYjJ22p+YL
         p48TJVASCCrpzwzLnw7AzusmVw/SfxDONd+NGKwOjyXKyGyJvMhcw3vmzNHjHVT+k3vS
         UdqozxK/KRrYLUvpK82hOcs83kTfYIJNqvSaD+UjUmJogFu2J+RD4JRE4tbSN+1ENDVl
         OsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FNHzluLfUaxr3+BQTAbtyKvp8fT7fI8o/97d48qjwEY=;
        b=xlFkORnt1rPm2MEgb9UZlHXoH8OA0U4QQK+lwGhK3ZM2qriee4zWKjg9sW667tpXl2
         Tj3ULUebljt1sjixRKxPRm+fdUxgzMxbJjEp2UkhTIbVyE19XZTqp5oWONNKz3PHhyYj
         50rJn6omeKROkIKFk3Fg+ju/uJ7L2rzZVQa6AzUuPZZuEuduaqa8SdDa+aUWEXinmmZA
         KgNsnbki1C3Zk8ScnH6986hsAh+P9XIoHwCm3SphPTY27pmVAhx7cy7MKsENuBjEd4zA
         HpXFgQKo1IM+USXUkkeptakV+2tOQfHb9N4glNXy6fiI9F9LwvjF9dsDiwek/MkOl0bk
         YkQQ==
X-Gm-Message-State: AOAM531LNLsyEqEHqROeh2wg4pDsjF+hb/zFjN4vT6h/BK2ZhSuP/R24
	LqOEXwy6hbqkoZJJVau/eaw=
X-Google-Smtp-Source: ABdhPJwjLF6jhbzfPNQSBNJ5VLTvc5LkVQN0UxNaUNqqLN/7wVLH4oBdiS3b9+q/2uPv0Z+txqyEQw==
X-Received: by 2002:a17:906:3b8d:b0:6fe:94ac:2a78 with SMTP id u13-20020a1709063b8d00b006fe94ac2a78mr17268539ejf.547.1653248942981;
        Sun, 22 May 2022 12:49:02 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935774.dip0.t-ipconnect.de. [87.147.87.116])
        by smtp.gmail.com with ESMTPSA id s17-20020a1709060c1100b006fee27d471csm419653ejf.150.2022.05.22.12.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 12:49:02 -0700 (PDT)
Date: Sun, 22 May 2022 21:49:00 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] staging: vt6655: Replace MACvIntEnable with
 VNSvOutPortD
Message-ID: <182b9f8edd1ce3f6ff12a2942e990dae0f80099a.1653203927.git.philipp.g.hortmann@gmail.com>
References: <cover.1653203927.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1653203927.git.philipp.g.hortmann@gmail.com>

Replace macro MACvIntEnable with VNSvOutPortD and as it
was only used twice, it can now be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
The name of macro and the arguments use CamelCase which
is not accepted by checkpatch.pl
VNSvOutPortD will be replaced in this patch series.
---
 drivers/staging/vt6655/device_main.c | 6 +++---
 drivers/staging/vt6655/mac.h         | 3 ---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 41bc87d80ad8..d9515eff05c3 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1134,7 +1134,7 @@ static void vnt_interrupt_work(struct work_struct *work)
 	if (priv->vif)
 		vnt_interrupt_process(priv);
 
-	MACvIntEnable(priv->port_offset, IMR_MASK_VALUE);
+	VNSvOutPortD(priv->port_offset + MAC_REG_IMR, IMR_MASK_VALUE);
 }
 
 static irqreturn_t vnt_interrupt(int irq,  void *arg)
@@ -1252,8 +1252,8 @@ static int vnt_start(struct ieee80211_hw *hw)
 
 	device_init_registers(priv);
 
-	dev_dbg(&priv->pcid->dev, "call MACvIntEnable\n");
-	MACvIntEnable(priv->port_offset, IMR_MASK_VALUE);
+	dev_dbg(&priv->pcid->dev, "enable MAC interrupt\n");
+	VNSvOutPortD(priv->port_offset + MAC_REG_IMR, IMR_MASK_VALUE);
 
 	ieee80211_wake_queues(hw);
 
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 42b216897218..8b3ba94dd02e 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -648,9 +648,6 @@ do {									\
 	iowrite8(byOrgValue, iobase + MAC_REG_STICKHW);			\
 } while (0)
 
-#define MACvIntEnable(iobase, dwMask)				\
-	VNSvOutPortD(iobase + MAC_REG_IMR, dwMask)
-
 #define MACvIntDisable(iobase)				\
 	VNSvOutPortD(iobase + MAC_REG_IMR, 0)
 
-- 
2.25.1

