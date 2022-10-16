Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59CAEC1
	for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 11:07:51 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so7528718wmq.1
        for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 04:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jrffFgggkAqssxs/AOrL4oU/8HAt28NpqZOzEFZ8Oc=;
        b=i05Dj1V6bU5L+IxlKGiBXnYX4cMNsrWsYrKRABenxAE5mE8M9JuYID7tb/mLEgLnh7
         IjiKTaS5E+KYJDTYwXt4OTcLB45jBdc2MzHN2Ld5nVD26je2w7t/V3t5GujfvgyU6BMz
         7WABkqW6uew3pQeAPcbLqt9o+ykwe7iRw7ueR3Ac7NmITYz2ijbc0yMHfxYr6LVP1OJM
         boD9jceSneo/CWwPEcJlKO1SCniCYlnp8lPB/rGYYaXKO3fEZNF03NWe30vWMzuonfT7
         +UTsN3h3mYfglHIBdv4nIehpedq4L3vJTMEr95OKbqpLD91Ps7Mq71T9WSH+RuJmYeT2
         KGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jrffFgggkAqssxs/AOrL4oU/8HAt28NpqZOzEFZ8Oc=;
        b=4LmpwHVzthiwBDb0NeQCMuzVWI+Ej9FVek9/FbrRmB4H6SD4Kmk+5xMCc5IjA4F2ay
         Ir93Twm9vVf2SgvJ7fvIpU6ZM0NRnOR/+9W1BSw4//smSFTwhl6adZa+hbPf6XTa0EE6
         zxwcIt0wiO2nLfk+MP3i30eJyOAjN/0Oujx847PX3FGZkE95xzwUxD0tHe8NYgLzeWvo
         RPOFPdVwIeXyqKFSF+JPATwUZR12EdutgoSESKIpd8JnkoRxDb15ZxwAQ3PWTExvCueQ
         HU4bwvRTouZiiLuda1FzT8BvOPubrr7DJez/j5rjT9xebk/Y1NoWrsLzrMgAmmYvvGFg
         kn3g==
X-Gm-Message-State: ACrzQf2y/oCi1gdRAxYDkrPkR1uozwnq7YQFyw06BY0cqs3rFrjaRoqG
	5Tm+3NFrFR9oUXlFO2VzxPfYfFAerHg=
X-Google-Smtp-Source: AMsMyM4NOp9snyhrbk8iARGZtzob3RfcRyBc/4JxhAiXvKII5SwMWh8M7TtVTGCsSa8BYMb5CcrpPQ==
X-Received: by 2002:a1c:c90c:0:b0:3b4:adc7:9766 with SMTP id f12-20020a1cc90c000000b003b4adc79766mr4136662wmb.66.1665918470110;
        Sun, 16 Oct 2022 04:07:50 -0700 (PDT)
Received: from morpheus.home.roving-it.com.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id m19-20020a7bcb93000000b003c6d0f8c377sm7123762wmi.7.2022.10.16.04.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 04:07:49 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 4/4] staging: wlan-ng: Provide a TODO file for this driver
Date: Sun, 16 Oct 2022 12:07:43 +0100
Message-Id: <20221016110743.1448067-4-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016110743.1448067-1-pbrobinson@gmail.com>
References: <20221016110743.1448067-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a TODO file that lists the tasks that should be carried out in
order to move this driver off drivers/staging. It's missing from original
addition of this driver.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/staging/wlan-ng/TODO | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 drivers/staging/wlan-ng/TODO

diff --git a/drivers/staging/wlan-ng/TODO b/drivers/staging/wlan-ng/TODO
new file mode 100644
index 000000000000..ab9d5d145b3b
--- /dev/null
+++ b/drivers/staging/wlan-ng/TODO
@@ -0,0 +1,16 @@
+To-do list:
+
+* Correct the coding style according to Linux guidelines; please read the document
+  at https://www.kernel.org/doc/html/latest/process/coding-style.html.
+* Remove unnecessary debugging/printing macros; for those that are still needed
+  use the proper kernel API (pr_debug(), dev_dbg(), netdev_dbg()).
+* Remove dead code such as unusued functions, variables, fields, etc..
+* Use in-kernel API and remove unnecessary wrappers where possible.
+* Fix bugs due to code that sleeps in atomic context.
+* Remove the HAL layer and migrate its functionality into the relevant parts of
+  the driver.
+* Switch to use LIB80211.
+* Switch to use MAC80211.
+* Switch to use CFG80211.
+* Improve the error handling of various functions, particularly those that use
+  existing kernel APIs.
-- 
2.37.3

