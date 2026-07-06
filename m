Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45CE17D6
	for <linux-staging@lists.linux.dev>; Mon,  6 Jul 2026 00:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783296603; cv=none; b=kF4C5n/UyfuTRCGLmNap3Qa9Uc8LxyhvmktfeUtG/RPnRjqwvE7WYWcQaSfXxHhbbQ5bzRh3R1ohFl5z+7k1C8/bLu9hYgYcZ//YtUM70ZVqmvJP6+1f7OkYVSg6wWqyKX5iaPWGgKaoYyYQHwlNmtWZrI2yoBlxK+bDYNj19Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783296603; c=relaxed/simple;
	bh=X1Ah+l3/ZB5oCV+QF+h+tusCtXKrXutWylNwgaixmVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eahL4GQA7UUegPF2G48vaB9snvMh/5WTwC6CxQWE6SMhn64Am23xPC6JbWMz7B1O1c9c7huByRh6+vnCGcfZxT03bQGwcrPn49IEqMON65BT8Pi3ellOibzRQFmbGBHTpPRsqQDbv4szAvamwzkyv4YVhoEKBKb/XHxiU/Q7tDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZXPkAnL; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZXPkAnL"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-662d984bedeso237771d50.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 17:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783296601; x=1783901401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WoWipZJJsquAFbGvSKcXoTo7sOkuUz1BZt1zlYOduU4=;
        b=EZXPkAnLHqbISRoLsJ4E5oqb4E+e3zt97xdeD9RcstvwFJKSEWVWgWxRuxi1HPxwkC
         zTWwfdyPH4aVSZdf0/0sRgyHylT/rmMep2PB2vwOO45KCp5x8HsG6HHs7pzHp4KyJXSc
         AfQOaRB1KtCUc2FwFTXvav7kiWpLaKpI3yTZ9/sYF0h0kcgH12UNzDWowRDJL11/ZBWe
         9Vx86UpI4Jd1ipdeG1eLynPD1yUyk0CukybaFyPt0rYYViKSlI8dc6vcC9oCgwKReoWM
         txFw+N2o+qlEhWTq0GvUCgx8hufmNg5Ae/FT9/8KV/ehkwNn/1kaqxAuluVbLRw6W9mo
         c5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783296601; x=1783901401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WoWipZJJsquAFbGvSKcXoTo7sOkuUz1BZt1zlYOduU4=;
        b=C2XtqN1B3ExGKXsRYyNe2+3qCFQ4D1RBab3kIBfUfxZ+Rxr+WouKc5qO7l5ITIhZUq
         9F2PsLjl9p5Hwxkl26DIaPgDBJ+MpjARKH2eiZm31svJYLPlPk/oANvDNFjr+IOA/aO5
         bq7XVG/3fZJVllrech+aW3fT33Cy79Cn3l1ob5l1im6YdkkyUvgarSu25KYDf6iW/r30
         5OqbhPJaGy29HgmViW3m71quXzE5dCvlpfKDRM1JKXA3XHvZwvLTWzNveDqXDYpnt7qR
         xVILoRcgLOx27iOIvKVERl+nJr4p61AlRTjhWxol1ylvi8Hijgk3Aq9EpVyrKgwtgqQQ
         pxkw==
X-Forwarded-Encrypted: i=1; AHgh+Rpq3+RKMo0E5cmc8NrMKBX8wsqk9BBXoqkBocgYDf9VZa8jmUCOO6VYgkHJCImhoYD2qagP3e9j96cl//Wn@lists.linux.dev
X-Gm-Message-State: AOJu0Yza+raI27itR+rU18ArEl+FdyCFqCvoBKoCqMXZzOIackxvSPhL
	VW6odPsovdb/J0jEP8e8Z+A1hz8rk5POgAFCBeA/jCHWWu2te77+BHla
X-Gm-Gg: AfdE7cljbvzPnkT52WI8zZCAog/2MFVdyX1Jv4SOJ2QLZsUd6ihQuSDiTs0DiXbsohs
	Eu7ibM2+lbhvETjGWA6QQGq1kVtDO511RQQl8lYbjsOZme4LB4oIRywPiUBuzR5i+858bWd05dz
	ifKAbXGvi/Cr5lRLKZLOABCfMpPydkpBywWKjC71aTfb8DwTXNYd2uMItT44Z0+MH6P12579/nf
	jSMYTJfdlhxw7Ff+w7Qqapx+Li2O7O40yZaq2Uzcbaro1ICLJGEjeu78tHFB9JQefF1PUkGfELL
	57qKhdx0GeIlaS1VH4JZ4PQ+rC12z62JNVzCmXuqnFgQLO27/pED0NB+Ttsj2amZKCBbZTF7+H/
	XuZ7d7fUw2UnhSDIpS6bQgPTpXNpWivbUnW8hMYRRU9gJ+/bxQzGpm688gwJE1XHS+gag
X-Received: by 2002:a05:690e:1241:b0:667:541c:2282 with SMTP id 956f58d0204a3-667541c23efmr5399080d50.9.1783296600821;
        Sun, 05 Jul 2026 17:10:00 -0700 (PDT)
Received: from desktop ([2600:1700:78e0:fd0::27])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-666408c2597sm4008673d50.21.2026.07.05.17.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 17:10:00 -0700 (PDT)
From: Neal Patalay <nealpatalay0@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mugrinphoto@gmail.com,
	matt@mattwardle.net,
	nealpatalay0@gmail.com
Subject: [PATCH v4] staging: media: atomisp: refactor pipe graph dump stage formatting
Date: Sun,  5 Jul 2026 17:07:38 -0700
Message-ID: <20260706000738.18478-1-nealpatalay0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original implementation of ia_css_debug_pipe_graph_dump_stage()
includes an off-by-one error where the original strscpy() size dropped
characters immediately before newlines. It also allocates over 600
bytes across multiple buffers on the stack. Address these shortcomings
and reduce stack usage with a single 256 byte buffer via a new helper
function, ia_css_debug_build_info().

Fixes: 662fb4fceb1a ("media: atomisp: get rid of a string_support.h abstraction layer")
Signed-off-by: Neal Patalay <nealpatalay0@gmail.com>
---
v4:
- Changed logic to truncate output after the third line
- Added offset check to avoid writing beyond bounds
- Fixed indentation inside helper function
- Separated variable definitions from code in helper function
- Fixed comment in helper function

v3:
- Moved "len_written" variable declaration to top of helper function
- Added local variables to track values inside helper function
- Fixed macro indentation
- Removed loop out of macro definition

v2:
- Fixed strscpy typo in commit message
- Changed Fixes tag to point to the actual buggy commit
- Dropped "flag" parameter from helper function and moved check to the macro
- Split long lines to conform with subsystem character limit
---
 .../pci/runtime/debug/src/ia_css_debug.c      | 198 ++++++++----------
 1 file changed, 83 insertions(+), 115 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 5113aa5973f3..19c4e0246c34 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1162,6 +1162,43 @@ void ia_css_debug_pipe_graph_dump_epilogue(void)
 	pg_inst.stream_format = N_ATOMISP_INPUT_FORMAT;
 }
 
+static void ia_css_debug_build_info(char *info, size_t info_size,
+				    int *offset,
+				    const char *flag_str, size_t flag_str_size,
+				    int *line_len,
+				    int *num_lines)
+{
+	int len = *line_len;
+	int off = *offset;
+	int lines = *num_lines;
+	int len_written;
+
+	if (lines > 3)
+		return;
+
+	/*
+	 * If new line length exceeds max line length,
+	 * replace the last ',' with a "\\n".
+	 */
+	if (len > 0 && off > 0 && info_size - off >= 2 &&
+	    len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
+		if (lines >= 3) {
+			*num_lines = lines + 1;
+			return;
+		}
+		info[off - 1] = '\\';
+		info[off] = 'n';
+		off += 1;
+		len = 0;
+		lines += 1;
+	}
+
+	len_written = scnprintf(info + off, info_size - off, "%s,", flag_str);
+	*offset = off + len_written;
+	*line_len = len + len_written;
+	*num_lines = lines;
+}
+
 void
 ia_css_debug_pipe_graph_dump_stage(
     struct ia_css_pipeline_stage *stage,
@@ -1194,123 +1231,54 @@ ia_css_debug_pipe_graph_dump_stage(
 
 	/* Guard in case of binaries that don't have any binary_info */
 	if (stage->binary_info) {
-		char enable_info1[100];
-		char enable_info2[100];
-		char enable_info3[100];
-		char enable_info[302];
+		char enable_info[256];
+		int offset = 0;
+		int line_len = 0;
+		int num_lines = 1;
 		struct ia_css_binary_info *bi = stage->binary_info;
 
-		/* Split it in 2 function-calls to keep the amount of
-		 * parameters per call "reasonable"
-		 */
-		snprintf(enable_info1, sizeof(enable_info1),
-			 "%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
-			 bi->enable.reduced_pipe ?	"rp," : "",
-			 bi->enable.vf_veceven ?		"vfve," : "",
-			 bi->enable.dis ?		"dis," : "",
-			 bi->enable.dvs_envelope ?	"dvse," : "",
-			 bi->enable.uds ?		"uds," : "",
-			 bi->enable.dvs_6axis ?		"dvs6," : "",
-			 bi->enable.block_output ?	"bo," : "",
-			 bi->enable.ds ?			"ds," : "",
-			 bi->enable.bayer_fir_6db ?	"bf6," : "",
-			 bi->enable.raw_binning ?	"rawb," : "",
-			 bi->enable.continuous ?		"cont," : "",
-			 bi->enable.s3a ?		"s3a," : "",
-			 bi->enable.fpnr ?		"fpnr," : "",
-			 bi->enable.sc ?			"sc," : ""
-			);
-
-		snprintf(enable_info2, sizeof(enable_info2),
-			 "%s%s%s%s%s%s%s%s%s%s%s",
-			 bi->enable.macc ?		"macc," : "",
-			 bi->enable.output ?		"outp," : "",
-			 bi->enable.ref_frame ?		"reff," : "",
-			 bi->enable.tnr ?		"tnr," : "",
-			 bi->enable.xnr ?		"xnr," : "",
-			 bi->enable.params ?		"par," : "",
-			 bi->enable.ca_gdc ?		"cagdc," : "",
-			 bi->enable.isp_addresses ?	"ispa," : "",
-			 bi->enable.in_frame ?		"inf," : "",
-			 bi->enable.out_frame ?		"outf," : "",
-			 bi->enable.high_speed ?		"hs," : ""
-			);
-
-		/* And merge them into one string */
-		snprintf(enable_info, sizeof(enable_info), "%s%s",
-			 enable_info1, enable_info2);
-		{
-			int l, p;
-			char *ei = enable_info;
-
-			l = strlen(ei);
-
-			/* Replace last ',' with \0 if present */
-			if (l && enable_info[l - 1] == ',')
-				enable_info[--l] = '\0';
-
-			if (l > ENABLE_LINE_MAX_LENGTH) {
-				/* Too big for one line, find last comma */
-				p = ENABLE_LINE_MAX_LENGTH;
-				while (ei[p] != ',')
-					p--;
-				/* Last comma found, copy till that comma */
-				strscpy(enable_info1, ei, umin(p, sizeof(enable_info1)));
-
-				ei += p + 1;
-				l = strlen(ei);
-
-				if (l <= ENABLE_LINE_MAX_LENGTH) {
-					/* The 2nd line fits */
-					/* we cannot use ei as argument because
-					 * it is not guaranteed dword aligned
-					 */
-
-					strscpy(enable_info2, ei, umin(l, sizeof(enable_info2)));
-
-					snprintf(enable_info, sizeof(enable_info), "%s\\n%s",
-						 enable_info1, enable_info2);
-
-				} else {
-					/* 2nd line is still too long */
-					p = ENABLE_LINE_MAX_LENGTH;
-					while (ei[p] != ',')
-						p--;
-
-					strscpy(enable_info2, ei, umin(p, sizeof(enable_info2)));
-
-					ei += p + 1;
-					l = strlen(ei);
-
-					if (l <= ENABLE_LINE_MAX_LENGTH) {
-						/* The 3rd line fits */
-						/* we cannot use ei as argument because
-						* it is not guaranteed dword aligned
-						*/
-						strscpy(enable_info3, ei,
-							sizeof(enable_info3));
-						snprintf(enable_info, sizeof(enable_info),
-							 "%s\\n%s\\n%s",
-							 enable_info1, enable_info2,
-							 enable_info3);
-					} else {
-						/* 3rd line is still too long */
-						p = ENABLE_LINE_MAX_LENGTH;
-						while (ei[p] != ',')
-							p--;
-						strscpy(enable_info3, ei,
-							umin(p, sizeof(enable_info3)));
-						ei += p + 1;
-						strscpy(enable_info3, ei,
-							sizeof(enable_info3));
-						snprintf(enable_info, sizeof(enable_info),
-							 "%s\\n%s\\n%s",
-							 enable_info1, enable_info2,
-							 enable_info3);
-					}
-				}
-			}
-		}
+#define ADD_INFO(flag, flag_str)						\
+	if (bi->enable.flag)							\
+		ia_css_debug_build_info(enable_info, sizeof(enable_info),	\
+					&offset,				\
+					flag_str, sizeof(flag_str),		\
+					&line_len,				\
+					&num_lines)
+
+		/* Build string in enable_info buffer */
+		ADD_INFO(reduced_pipe, "rp");
+		ADD_INFO(vf_veceven, "vfve");
+		ADD_INFO(dis, "dis");
+		ADD_INFO(dvs_envelope, "dvse");
+		ADD_INFO(uds, "uds");
+		ADD_INFO(dvs_6axis, "dvs6");
+		ADD_INFO(block_output, "bo");
+		ADD_INFO(ds, "ds");
+		ADD_INFO(bayer_fir_6db, "bf6");
+		ADD_INFO(raw_binning, "rawb");
+		ADD_INFO(continuous, "cont");
+		ADD_INFO(s3a, "s3a");
+		ADD_INFO(fpnr, "fpnr");
+		ADD_INFO(sc, "sc");
+		ADD_INFO(macc, "macc");
+		ADD_INFO(output, "outp");
+		ADD_INFO(ref_frame, "reff");
+		ADD_INFO(tnr, "tnr");
+		ADD_INFO(xnr, "xnr");
+		ADD_INFO(params, "par");
+		ADD_INFO(ca_gdc, "cagdc");
+		ADD_INFO(isp_addresses, "ispa");
+		ADD_INFO(in_frame, "inf");
+		ADD_INFO(out_frame, "outf");
+		ADD_INFO(high_speed, "hs");
+
+#undef ADD_INFO
+
+		/* Replace last ',' with '\0' */
+		if (offset > 0)
+			enable_info[offset - 1] = '\0';
+		else
+			enable_info[0] = '\0';
 
 		dtrace_dot("node [shape = circle, fixedsize=true, width=2.5, label=\"%s\\n%s\\n\\n%s\"]; \"%s(pipe%d)\"",
 			   bin_type, blob_name, enable_info, blob_name, id);
-- 
2.55.0

