Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA56EBF
	for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 11:07:50 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id n16-20020a05600c4f9000b003c17bf8ddecso7824868wmq.0
        for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 04:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFemdyq/MsdeE5z9DJPdQQXACIa9o7CC/xzWc4kueh0=;
        b=kgowgMjg1hay5MXG2z3+SJEpAIanhmmC2bUNjVmxmsOUB33j8pnG12QNOCEGAuVtid
         LGT/zK5X50XcqMv6ln4y6cs4B9fzJXTIWSuueei9y6DKcrgFm0ng9z/kjMIjilxdUH5v
         UV03VpOL1P4YWilupyqYNCocdF0VO7T7Ra9o4mrlyF2eBTsBJ00VrBnpjwdm1iq7G5TA
         WYepJK8oJlyrEGqyloENkjxj86dTB/CTV14x025lPVssOMAUivv1e3s9M57aoi1/Hd/g
         neoq5m4GwV6yZ+bxC/FR3SjAeDYAvzHoWvp/xb8kEQK12ReT9yDAMPMpAS8BqGnvrD8J
         SyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFemdyq/MsdeE5z9DJPdQQXACIa9o7CC/xzWc4kueh0=;
        b=yd3io5bedJ0UH9GFy16h3ZsZWJ8ae8+PIFV15/vWe24D6lmZQISRffUZVoQ/8UAzPc
         ZAbvajmN8nDncNqjlZuWuxqIKew3TXLpab3wp9gEycw2GroafwP29N+CzTEd+66IsqF+
         aNTkrEUG4SujY0PHUSbjk+yThZGpwEGDGca83hxE+LWq0ZGUjvRD0wHySmcQx0s+z2VC
         kE3Ev0/TORm39aEi+ZAZwHTClblCrtXTdrCfMqa/c886InQ3sflZ4LSuvyT6y+djPq/N
         76e7nMpwHavLjgHSn2hqFnYG0wuBNiyrgsP6BnwbgazOYxh3tjX14xt6Xpl1jn/uTGOj
         dNQA==
X-Gm-Message-State: ACrzQf0VYRUbuoW48Ec/4DKw3MTTxE5YXMtLLKe8lOBVE0nNkqLMQXyh
	jJY3wrsRB8gwTJ8yt4x7KU0=
X-Google-Smtp-Source: AMsMyM4JCDzRAqSgjO3fdXqo9c8bKy3ommHoTV7a//Vmq6fCvQaje9tfPVt2MZ06NwxZoB+4nY8mqg==
X-Received: by 2002:a7b:c01a:0:b0:3b4:a61c:52d1 with SMTP id c26-20020a7bc01a000000b003b4a61c52d1mr4145207wmb.146.1665918469216;
        Sun, 16 Oct 2022 04:07:49 -0700 (PDT)
Received: from morpheus.home.roving-it.com.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id m19-20020a7bcb93000000b003c6d0f8c377sm7123762wmi.7.2022.10.16.04.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 04:07:48 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 3/4] staging: ks7010: Update the TODO file for this driver
Date: Sun, 16 Oct 2022 12:07:42 +0100
Message-Id: <20221016110743.1448067-3-pbrobinson@gmail.com>
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

Add move to mac80211 from wext to the todo for this driver.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/staging/ks7010/TODO | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/ks7010/TODO b/drivers/staging/ks7010/TODO
index ab6f39175d99..80c97543b977 100644
--- a/drivers/staging/ks7010/TODO
+++ b/drivers/staging/ks7010/TODO
@@ -27,6 +27,9 @@ Now the TODOs:
 - fix the 'card removal' event when card is inserted when booting
 - check what other upstream wireless mechanisms can be used instead of the
   custom ones here
+- Switch to use LIB80211.
+- Switch to use MAC80211.
+- Switch to use CFG80211.
 
 Please send any patches to:
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-- 
2.37.3

