Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447C772
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 10:44:20 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id t140so9029238pgb.13
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aK68x+At4MGL6Gp4oOcXkofX3goWjEGh1fkkQH9ZBPk=;
        b=Q93B1RXjm2AuT5o48BAguqnNgVw+uHuSd6eXJ9ucN5bxdNe5BvxH8s/Qug4GLJYb1C
         k+Z/49Dt1BMQAUSp+KA7bm0CZc7nAB6wn9ogdZwCT+Jg/S06aRstk97Ql33T6/FzwEFA
         cz43u9KFfiVQRf7wKJ9wi+DNyb5j/TrZYrERwWGjCAqBy9sUGm7ErR1t6CRY3D/YNEMS
         JHtrF+c12P+ZW8BkbNkTfM7qrQybpSjHAyOH2/YpDJlsPosE8TM6rv+zrWDPcZ+LC8eq
         IDMkKWLyJPwDCYlDFZfSB7AdGt4+HqKypyeI1lT3EaQyTI3B6jwMUjLHjdA7T/0l60b/
         d0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aK68x+At4MGL6Gp4oOcXkofX3goWjEGh1fkkQH9ZBPk=;
        b=BnIlJEOAajbooQNMarqMKXsGXyfJejNltOXKbRZQEq2DOxVk5seDjPC7iBtp0QYNtJ
         fKKRzXxjdKxwk+buTAEV1H7i0ObQoJ0WQt3RTuxDPBi6KZPn9Dn/rGDLp1UR+v+tCNS+
         SvbZSffYuUWk/23WIWLHEidiogPuoa70Bj/if/eZ3defmm3Hn724D86md5nloPjrNnNJ
         b7sGVy7yrt5ou5JJwEmg7iLTxiFDwCu7Yd3SwfV1/ixFGtuhdwy4L6X44ABQN98UtP3X
         OnY1HHiQBbK/fYxLc/ozFOrp6fK6EmG9FOUWCrrdvjWWLZRD4O6qnFE/fLyZlL7X42/m
         8gug==
X-Gm-Message-State: AOAM532HhQyEWp9477WXJvzQEiRGsdtMkErNyMy7Kf4r9Vu1OU6IK07G
	cUbCCWjFF1o91IWPm9J8W4A=
X-Google-Smtp-Source: ABdhPJwMtchSnhBqNaov0Ggf9tQE/rWlUWFfGygCKo7paj0Z/6iJoO7WobE/959rZvQfqxgW3EexKA==
X-Received: by 2002:a63:7e02:: with SMTP id z2mr25523575pgc.404.1618224259724;
        Mon, 12 Apr 2021 03:44:19 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id gg22sm10685553pjb.20.2021.04.12.03.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 03:44:19 -0700 (PDT)
Date: Mon, 12 Apr 2021 16:14:09 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: nsaenzjulienne@susu.de, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v2 1/2] staging: vc04_services: remove trailing whitespace
Message-ID: <5a54a06bae846f1f037165c0c7ba7ffe5a55a4a8.1618223171.git.mitaliborkar810@gmail.com>
References: <cover.1618223171.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618223171.git.mitaliborkar810@gmail.com>

Removed trailing whitespace to adhere to linux kernel coding style.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- No changes.

 drivers/staging/vc04_services/interface/TODO | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 0bcb8f158afc..adb28f46ba67 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -27,8 +27,8 @@ unused.
 3) Make driver more portable
 
 Building this driver with arm/multi_v7_defconfig or arm64/defconfig
-leads to data corruption during the following command: 
-  
+leads to data corruption during the following command:
+
   vchiq_test -f 1
 
 This should be fixed.
-- 
2.30.2

