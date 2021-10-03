Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B333FDE
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 20:01:33 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id v4so2581945vsg.12
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 13:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PWnB5K1Grj0xQyY5Skv45XzlXt4yBMt+nMNlhoq0dAk=;
        b=kxcwQ5isTHdCrmNEqg2mueB/somw/dnSZ172BkV66GxYsy4NpfHzCbJ2Fx8N9vmf1o
         8nJnAbaCA/cJR6C3dStiK3GIxyYE4rsaL1gV35KDBjX2Ep6luZs2ne5giXf0UoZdzinW
         BBBxq38jFMTTe2ur8J2U3rr8svCoVYMfVrHgWNQLTz17nyqzjP2bN+zK7PWl8UThXCM/
         p8dq1o5C7OI7Z+4qUXFzx3GmUISc/YcsVNa1fUHhvvweN3DL5vo2DC42eoswbV8sUiiL
         nqcIeGambAq/IawRxXDD7TfsojNg3NiUvL1mr5nw9HnqQaq/HBYm4ERkt8eAw+QHX7o+
         /NRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PWnB5K1Grj0xQyY5Skv45XzlXt4yBMt+nMNlhoq0dAk=;
        b=BeJttGae2enlZRciDWeoz6iHqzFfIN73eP22FUxAoVmCst1hw8VdtYCC7vDxo1W7hr
         GTRKbJfq9EewzjRuMhNYLTc4EhWaz76nXjqRMNH/Fuhlc7K4BzhmPnrpV7Fxbg3Bfesl
         XKvlmk5nnbr7vKpsnaJAUtlbWVRmjTDoYr6HnjbldNhITjS2OtW8LyFjUWP3o3u+gJjP
         HqQ3T5jC+2QBcehlmIomO8DXdOXOwD0VvKL+4VMGb43AYbW6nxJMbhCxfSqrlDrNS6u4
         aNFYhcknL4EwzR5e3xYyW0/v3rqlJYRUS+81e5nSHYw2jytWTkBwow2O+jxu2iAuov60
         brAQ==
X-Gm-Message-State: AOAM530rDuwcKJTX7QF4vcMhRa6dPREH7VLyBXqjFMvqroN3VZ7X+qYZ
	ea90FYwOB8sMXmKBH3IZRWjzvobSrZjUnA==
X-Google-Smtp-Source: ABdhPJwGIuGvigJRC8FTrma9fSmPm3wosjqCuei6Z9n0gA9efbcU/0UCPT24xg+3XkmSv6NApARWJg==
X-Received: by 2002:a05:6102:3593:: with SMTP id h19mr10540551vsu.23.1633291292266;
        Sun, 03 Oct 2021 13:01:32 -0700 (PDT)
Received: from localhost.localdomain ([181.23.73.135])
        by smtp.gmail.com with ESMTPSA id x21sm6691019uao.2.2021.10.03.13.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 13:01:31 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 9/9] staging: vchiq_core: fix quoted strings split across lines
Date: Sun,  3 Oct 2021 16:58:02 -0300
Message-Id: <20211003195758.36572-10-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003195758.36572-1-gascoar@gmail.com>
References: <20211003195758.36572-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Quoted strings should not be split across lines. As put it in [1]:
"never break user-visible strings such as printk messages because that
breaks the ability to grep for them."

While at it, fix the alignment of the arguments in the sentence.

Note: as the line now is:

 vchiq_loud_error("%d: service %d (%c%c%c%c) version mismatch - local (%d, min %d) vs. remote (%d, min %d)",

checkpatch.pl emits a CHECK: line length of 123 exceeds 100 columns.

But now the string is grep-able and the whole function call is more clear.

Reported by checkpatch.pl

[1] Documentation/process/coding-style.rst

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 416110bf20fa..fa65a99ae54a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1499,13 +1499,9 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 	if ((service->version < version_min) || (version < service->version_min)) {
 		/* Version mismatch */
 		vchiq_loud_error_header();
-		vchiq_loud_error("%d: service %d (%c%c%c%c) "
-			"version mismatch - local (%d, min %d)"
-			" vs. remote (%d, min %d)",
-			state->id, service->localport,
-			VCHIQ_FOURCC_AS_4CHARS(fourcc),
-			service->version, service->version_min,
-			version, version_min);
+		vchiq_loud_error("%d: service %d (%c%c%c%c) version mismatch - local (%d, min %d) vs. remote (%d, min %d)",
+				 state->id, service->localport, VCHIQ_FOURCC_AS_4CHARS(fourcc),
+				 service->version, service->version_min, version, version_min);
 		vchiq_loud_error_footer();
 		vchiq_service_put(service);
 		service = NULL;
-- 
2.33.0

