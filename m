Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88C82F43
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 12:29:06 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id m2so26660882wrh.6
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 05:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680438545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KuUlpAuMuhV9A7Ol8z+aU98hs8SWlHqvB5/lhugn4Hk=;
        b=T9C2x6tLoLpcxgjAt71Z1h1HV2OyyO+4KCC4rZwqZHTOS0EFN2sAY9SstJJOpPxZMh
         2ES8ZtcnnGdX9ErXt9XZQYpgxFKHGi/NVu4VeNYO65TSbECD3oCOGiy2hV7lC4iM7NCi
         zrB68IVghSucVU3mVASoDP2ry0w8rAkEK7rYvQwp/kbYzo39v3ZU7Hl3KHngMMHRepd7
         ctIdpqh8Pt4zxH9iIbE5Tay4GTj2mieSnizJbqerMZ7wUT86inViLk72TCK0BO+C6e9k
         OhfFsvKaat9f+cg+y1KZlWO8ixy8GeCdX/BMJ9QlA+vQrHnl2GlFLZCvx45QsnuvRR1c
         dlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680438545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuUlpAuMuhV9A7Ol8z+aU98hs8SWlHqvB5/lhugn4Hk=;
        b=eYhidf7W1Na9zK5azbTrLPjv+fn6/bktzWnWyvAgxdTwYwCUoe61uGmCn/3r0y2Vxp
         jElKv/w/5/ybP+1dXrjoo8rOAsVHGmvL4ushypt7ExI3oMZgF7BCxw5XI4XCRHQm1Mrj
         wWeCwg2neZJXl5SAn8T85pQurwGTHmXD21TkeM/Jt8aqNSdAK/CN/tg6Ebyp3TIhmF7m
         BhVoJb6djnukVq82RLtlye607cQBU/UZxlIk9VYioSOFESrQypYSUwLkBNuPj/gNCpdx
         OV+qXS7gEWvHHp6Kb6Vi3k7kNROSzZm+JbT3Y+rGjul5SGT6tJ1SZl0V2+jRWP9Maj0t
         1afQ==
X-Gm-Message-State: AAQBX9dbO/80wFzA8SWnI/iD04/ss5TEPo4w1wLn8+WtR3f6GCy+tV4b
	MjNjVLqji6alFBco6HlAJMY=
X-Google-Smtp-Source: AKy350Zt2LHhRlwXRTSDoWEQjQ4BvMtwoMbyN+POOrEFbySFdw8LOMlkl9O0bDOvllagr3j4Dwnt7Q==
X-Received: by 2002:adf:df11:0:b0:2e4:e6b3:78ca with SMTP id y17-20020adfdf11000000b002e4e6b378camr8297688wrl.70.1680438544676;
        Sun, 02 Apr 2023 05:29:04 -0700 (PDT)
Received: from arch.localdomain ([2a0c:5a82:e403:1200:d6da:3a66:5cd6:7fe8])
        by smtp.googlemail.com with ESMTPSA id d7-20020adfe2c7000000b002d419f661d6sm7202530wrj.82.2023.04.02.05.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 05:29:04 -0700 (PDT)
From: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
To: "Bryan O'Donoghue" <pure.logic@nexus-software.ie>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
Subject: [PATCH] staging: greybus: loopback: fix up checkpath macro do while error.
Date: Sun,  2 Apr 2023 14:25:51 +0200
Message-Id: <20230402122550.70682-1-angelalbertoc.r@gmail.com>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap macro in a do-while statement.

Signed-off-by: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
---
 drivers/staging/greybus/loopback.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index d7b39f3bb652..371809770ed0 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -162,9 +162,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
 static DEVICE_ATTR_RO(name##_avg)
 
 #define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+	do {		\
+		gb_loopback_ro_stats_attr(field, min, u);		\
+		gb_loopback_ro_stats_attr(field, max, u);		\
+		gb_loopback_ro_avg_attr(field);		\
+	} while (0)
 
 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
-- 
2.40.0

