Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16691EBF
	for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 11:07:49 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v130-20020a1cac88000000b003bcde03bd44so9936150wme.5
        for <linux-staging@lists.linux.dev>; Sun, 16 Oct 2022 04:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJTA3HKttJ2ZvHS1cYiigAxh/ijr2B7jM/ZAdK7dHGQ=;
        b=bdUyMv28gAml7xw84EfXXGAoMe4DdflxE82pxlzSRXXqur+s28bQgg2WnqP1YfUOHl
         BE09dNqCiu8s1fUQLicG0V9nuK8n9bYhDe1Lsa/kjLx0dDxtZMMHA4jLZJjjWA3iNjh7
         9goGx94eq5M7RQPbPrPR67gr4IpZvh17Clp5MF3JwHZ9QJ9u0uhpzcz/KkvK36ig/NZS
         YTkZxmfDYTXqgP56TCliXS/xjN6cSAGLgtt/oq6yZMLIg/weM7RthBXpZP5Odv5atlq1
         QORSJzLh8wipoALfpo2nE2sGOYMJiNV2QhK4jS84K3Y919c2LfXyz5KCpwV5maJSMinz
         g1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJTA3HKttJ2ZvHS1cYiigAxh/ijr2B7jM/ZAdK7dHGQ=;
        b=tiMgAQ5vv7KpmH18G2sSHWqNTHmP5hj3d9zQ1laa1TyvaRThsJat0rK+VFJ5q2QLQr
         t7ffyjS+i/En7JndOVWkepTa4hU2XhSVAxEJcEBLapc1k50JB8q6VjrfVvL5ukMw1fAB
         xGpdzec99UDhbFpstxwkCdgzpfCieSiOXZ/SaJDxbEcbcAGFwp7PCPZV1iTrwO+WG5BA
         YHUvIBaffYgCBLzoa+WBKwomVd4p38Vb5BNW0iLJFZY3UqmpHl5HqTb3T8UDiILbpZrR
         EgNT/be4jb8XMiUcb1tgpj+kjfhA0N+8OSq5SlRjykaGWMtKuzeFN5tR/bImXPHKEte7
         guFQ==
X-Gm-Message-State: ACrzQf0nTNtew154lvM92f84fFO/TaCvcya4fPcaDIicpgvNkU62a662
	lWoy5Xr79vGRlFaHaqdY5wY=
X-Google-Smtp-Source: AMsMyM4yhQZMMJVGwmnaPbyKqtEdEX2wpQGVdo7Bx363hfI0XDR6Tuv/6jWfEoJ26TOFQoaaCjmoyA==
X-Received: by 2002:a05:600c:4f10:b0:3c6:dcc6:51d7 with SMTP id l16-20020a05600c4f1000b003c6dcc651d7mr4004547wmq.91.1665918467255;
        Sun, 16 Oct 2022 04:07:47 -0700 (PDT)
Received: from morpheus.home.roving-it.com.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id m19-20020a7bcb93000000b003c6d0f8c377sm7123762wmi.7.2022.10.16.04.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 04:07:46 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 1/4] staging: rtl8192u: Provide a TODO file for this driver
Date: Sun, 16 Oct 2022 12:07:40 +0100
Message-Id: <20221016110743.1448067-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.37.3
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
 drivers/staging/rtl8192u/TODO | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 drivers/staging/rtl8192u/TODO

diff --git a/drivers/staging/rtl8192u/TODO b/drivers/staging/rtl8192u/TODO
new file mode 100644
index 000000000000..ab9d5d145b3b
--- /dev/null
+++ b/drivers/staging/rtl8192u/TODO
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

