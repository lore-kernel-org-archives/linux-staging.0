Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98942FAD
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 21:06:53 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id b6so1806660pji.4
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 14:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=clRlkcTWzJOWdb6SjT1HZu+AyElzVwLtoYPXziOiXRE=;
        b=MBUIR3iBfXKxxQGTkwEdR+msAp6pxmWHaDphvmnJvT1Zw3YRPe0XXCC1E1e0Bq7P9v
         PHNDTqIkm/jI1FEa26EuyG+8VRkITbDssqS0hfWFfeIsKVWMxs6NsU4giYYW+nhBICQ9
         RxMzcJq+3X+F/NXCQU0H77itPS7DDeCUh+z/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=clRlkcTWzJOWdb6SjT1HZu+AyElzVwLtoYPXziOiXRE=;
        b=RdD2oaE3i2E2wqehjt/okiJYn//nr9LslBl/yAUBduF+G7y11YiJJ1J5+Kr//qvsW0
         A94DinJjggCjFDzFOiuaxZXMK9MpO4VEsiEBTIUJa3jLkg3xkY7rVRcEVsjWXqz8F9yI
         +Pv6lLmqU6hYZZdhhDw1TDgpNGUEca5PVdNJDro0UirA+atYvYxyCJwOpyh3EOoJUvOP
         4V1DfPLk4sS/ceXD+t4+zpE0PhfiPzffT0PyIbuubxRhpWmqNi1XepH6lftEpHbGaniC
         IBXQlqbaAP6yWaoNO/qj+GZPmkaaRSEfBybz8w1PPYfJN7Foi3eRb00h/8hyDHhCXqWI
         MadQ==
X-Gm-Message-State: AOAM531h0KiAdPXFL2CQeW90e/fGbUJOXBQm9a/DBiWHGUOJp9BXJ+4b
	3YFsVqw6Z+bc2ByAnTuNLbH2+A==
X-Google-Smtp-Source: ABdhPJyQWD89modfR5XqhD/BrBVi4uhzmxv+/WY0dPBKz1b0mLB8ON+0pnmzIlozqgKLDJGyoixVLw==
X-Received: by 2002:a65:420d:: with SMTP id c13mr9244079pgq.123.1627420013548;
        Tue, 27 Jul 2021 14:06:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l1sm3813994pjq.1.2021.07.27.14.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 14:06:50 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Keith Packard <keithpac@amazon.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	clang-built-linux@googlegroups.com
Subject: [PATCH 16/64] thermal: intel: int340x_thermal: Use struct_group() for memcpy() region
Date: Tue, 27 Jul 2021 13:58:07 -0700
Message-Id: <20210727205855.411487-17-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3277; h=from:subject; bh=FXb9nQQ+9raXNRheCnPL/rsMtfpVZSmOVeEiPUzBx+k=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOD97boEQtghYWjunVAHXryqRBeKslQ/U0/9Z2K SuHsN8WJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzgwAKCRCJcvTf3G3AJs4JD/ 4t9krlI0msPh0DWMgqWRsM+X+y+HiMVgVUi7JkKAiBNJZoty9G4c1eS7yLV6TgLer2yFH8Ds58wUxF O6n5C18sFXheNiEEW+6vqVVeyQpO6nOPUonTlA8hTYBZp6CBNW7L7fqFalI7RlROQmukoEwMQZpWKx EuiGE22FT/3gJFEHq6KV61yPGYruCiyqaRADMcMMvyaJddy1qUkMgv0+9MsD6Pk/GN14+iLJT/WvX/ +Ncg6xMtv77TZnfLggNoIAXvzxqKTuj4YKPXx37SB2DDRCzdDh7R0hdU6WnJYEDwR5nd28AxRY9pW0 3/vFBrVdXmb5M1ePJqtCrbIM24arQveQJ0OFOeHTeWVNTcpF2rYY6HkYdqN5OgBXbagUUrHLo5sTJT oCoXT0USJzevlZoW3hXd+qGHUmuaA7+oUpf8ERJftB1gtBZ5+mAE3oNp6XoGlqZWXKaZOqEXohtJdE JKAKoqmW3JI+EQI+YUWLhorOoexqDCL3tG1VxN6M8wVEznEOVlCPdgcKjMwd4TvvKajC88ejnODvYX Yx+uFlSgaEFH992Tzy+Sem73iwT45T1pxFzlgXi6UKZ/H5V8dY1HWDHhQdWkFNrA7YldsHu5LMPO23 EVZMhiu2pPLzAvDWB389kz3t6FqAo/HGYnm8kfHnyCibi/cFhsXVyBwQujpg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), avoid intentionally writing across
neighboring fields.

Use struct_group() in struct art around members weight, and ac[0-9]_max,
so they can be referenced together. This will allow memcpy() and sizeof()
to more easily reason about sizes, improve readability, and avoid future
warnings about writing beyond the end of weight.

"pahole" shows no size nor member offset changes to struct art.
"objdump -d" shows no meaningful object code changes (i.e. only source
line number induced differences).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 .../intel/int340x_thermal/acpi_thermal_rel.c  |  5 +-
 .../intel/int340x_thermal/acpi_thermal_rel.h  | 48 ++++++++++---------
 2 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
index a478cff8162a..e90690a234c4 100644
--- a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
+++ b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.c
@@ -250,8 +250,9 @@ static int fill_art(char __user *ubuf)
 		get_single_name(arts[i].source, art_user[i].source_device);
 		get_single_name(arts[i].target, art_user[i].target_device);
 		/* copy the rest int data in addition to source and target */
-		memcpy(&art_user[i].weight, &arts[i].weight,
-			sizeof(u64) * (ACPI_NR_ART_ELEMENTS - 2));
+		BUILD_BUG_ON(sizeof(art_user[i].data) !=
+			     sizeof(u64) * (ACPI_NR_ART_ELEMENTS - 2));
+		memcpy(&art_user[i].data, &arts[i].data, sizeof(art_user[i].data));
 	}
 
 	if (copy_to_user(ubuf, art_user, art_len))
diff --git a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h
index 58822575fd54..78d942477035 100644
--- a/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h
+++ b/drivers/thermal/intel/int340x_thermal/acpi_thermal_rel.h
@@ -17,17 +17,19 @@
 struct art {
 	acpi_handle source;
 	acpi_handle target;
-	u64 weight;
-	u64 ac0_max;
-	u64 ac1_max;
-	u64 ac2_max;
-	u64 ac3_max;
-	u64 ac4_max;
-	u64 ac5_max;
-	u64 ac6_max;
-	u64 ac7_max;
-	u64 ac8_max;
-	u64 ac9_max;
+	struct_group(data,
+		u64 weight;
+		u64 ac0_max;
+		u64 ac1_max;
+		u64 ac2_max;
+		u64 ac3_max;
+		u64 ac4_max;
+		u64 ac5_max;
+		u64 ac6_max;
+		u64 ac7_max;
+		u64 ac8_max;
+		u64 ac9_max;
+	);
 } __packed;
 
 struct trt {
@@ -47,17 +49,19 @@ union art_object {
 	struct {
 		char source_device[8]; /* ACPI single name */
 		char target_device[8]; /* ACPI single name */
-		u64 weight;
-		u64 ac0_max_level;
-		u64 ac1_max_level;
-		u64 ac2_max_level;
-		u64 ac3_max_level;
-		u64 ac4_max_level;
-		u64 ac5_max_level;
-		u64 ac6_max_level;
-		u64 ac7_max_level;
-		u64 ac8_max_level;
-		u64 ac9_max_level;
+		struct_group(data,
+			u64 weight;
+			u64 ac0_max_level;
+			u64 ac1_max_level;
+			u64 ac2_max_level;
+			u64 ac3_max_level;
+			u64 ac4_max_level;
+			u64 ac5_max_level;
+			u64 ac6_max_level;
+			u64 ac7_max_level;
+			u64 ac8_max_level;
+			u64 ac9_max_level;
+		);
 	};
 	u64 __data[ACPI_NR_ART_ELEMENTS];
 };
-- 
2.30.2

