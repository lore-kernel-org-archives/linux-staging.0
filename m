Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869A02BD022
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783237150; cv=none; b=V6G14J62KvFQejAYrMNOkMaCX0eu+1gcG16JBdzZhV6vzoJsKWRHCccfMQw1PlaqplgNBw2eSCEoaHA+gwcur4r/oDwoyi/B1wR57/gSwNYXR+Q5BTftFKwFOrW2w14J2y2Xv4zkQxljXM2RRVJGCfEDaRjweKQasHDHgmkisKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783237150; c=relaxed/simple;
	bh=HjeCkmkrEZBv8g3eS5rqFaD5o8OMdcgrVvCwWBMQ07Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dw/Om/fnQbkoUuwD14kCyr+ybhMz0M9cAT9/LoBiznJ0BLefDTtgCImX6TW/UvdNwjfe2LU68ZNL6MXW/3q+LE7REQafyMObrNqdbfgjlp/WRVDGPhY1jZbwpLB4qa2uDEuP6Ipi7SAN5x9b462ZGzPrMm8U9uBYSZHytubfaY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajwXv9Ux; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajwXv9Ux"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8129622b57dso414127b3.3
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 00:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783237147; x=1783841947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jvuBiHYTDBytNW3yLYYgf9Uuwz/sK5RIDor3kGdnP0=;
        b=ajwXv9Ux+16PQs5nMKsYDwvpRdoUfh7ogNe+2ZI8AKbWBAu9QkL/3BOJzik2xBA/FA
         PjPstlufShs1VduitK6wEzFrBU9WaYe1UZrQVfx18DIgT86EppSnIGJOWPGosIW3K3iP
         wZ4uufCmRgn44ql8IFtTj8kWviuRS/TFUjvAnQt0ENrvtugfdpboJtsMRFlHTPBz0/Ue
         8p1fNiB7gpdCNJP+hLCq1OMgK5iprB8BLhdPS7wWzzckv+elAx+RfxJngBGliGb/oWR5
         QYaBr3tRG4H9ZU93Yz0TqbCZhw3b2V8tm3smKeEuE7/AyqmyZsv8z6JfusffukmWQcjB
         njCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783237147; x=1783841947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jvuBiHYTDBytNW3yLYYgf9Uuwz/sK5RIDor3kGdnP0=;
        b=Yjql5mCDWYRL511sFM+7o/kygM+bJRglSPOYxgs8/Bprfl5djJf+cYps9giEK03Ndp
         md9UvPNvV9OdTjVhfDiLb3CMit1ApIsZeEJ4yjo0mhg6NiFefGOugRezuK+o7tSGOY28
         T+H25/jrUdGn/b5hg8XjoI6B82U6uk4Tf0JzaQHyVjpuY2IcvH6Oap9JHjC/c8GRMMQL
         DVYr57CIV/kZtD2mLkbaodDS3bNh8fHhRQ/F9pWaKHO30tg7P5cV34azJEucgPEPsyWi
         p1UH9ChcvCaC9UwQClFlk9oJbL5EEFZ+enuQ73pHvVIjLgasSyiqMt7/2+r9SJ/y4bBa
         En+A==
X-Forwarded-Encrypted: i=1; AHgh+Rp+DKPx1OG7eDgBEfrlaZElIbkBj6gGiP2L6BU7ajOK+kYZmQ01vUKsxuT2aNmU6pNLIke0eH3aMr0nqrdJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3WKLq/bCwDghTIJl+bSmvY43vMmU3kV9WQsO3Kv1l/ReJ15nW
	w0uBY0uaqQS5qXbVUEwp2pTBHBqhGd4ywcfVLyue6G09JDKoYkYNYKKk
X-Gm-Gg: AfdE7ckdWU9S9YtlxxYT9PyaE2Ca8UaahO6lXEOVLg8v0aoUufEiKoghrzng4DSFk1v
	LosnMiVu9vi/j7HohrgeNv3/MF42pIULDM5pIuAcgidgeySQ45jhjtOapqFkPvs+ObAWe2CrmU6
	AiVt8COuqJ9nturBdLoRtJwJ5nFRf6hZecYacZMrrOWPUeDq7mE+k7S5221RVBrZ9EZMeqH1fK1
	vI3TeYZPZImDQG3ahygKRcI63v11u/fxq963KCVgJ9EELzOPT0S8m5QGFhVVsSW7oM1zezY+ZKA
	V9wpEnTYGQhrzz5ybzTWsSshT+FScW9KzHUQrsxcGTyCIf0XeMeevMiJ4KaWdW6H7sQGZReL5e3
	/KgYMP2E6TEIgKm1Ucl/PIh6cNx2EJNcA69dhcE0KIu+EYh9gahZ308auwa8PED2qgxTR
X-Received: by 2002:a05:690c:6d83:b0:7fd:6d19:5a8d with SMTP id 00721157ae682-81723da6a4fmr59711097b3.8.1783237147540;
        Sun, 05 Jul 2026 00:39:07 -0700 (PDT)
Received: from desktop ([2600:1700:78e0:fd0::27])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81448cd06a1sm43212147b3.21.2026.07.05.00.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:39:07 -0700 (PDT)
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
Subject: [PATCH v3] staging: media: atomisp: refactor pipe graph dump stage formatting
Date: Sun,  5 Jul 2026 00:38:44 -0700
Message-ID: <20260705073844.146578-1-nealpatalay0@gmail.com>
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
 .../pci/runtime/debug/src/ia_css_debug.c      | 185 +++++++-----------
 1 file changed, 70 insertions(+), 115 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 5113aa5973f3..e45334f7c2c4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1162,6 +1162,32 @@ void ia_css_debug_pipe_graph_dump_epilogue(void)
 	pg_inst.stream_format = N_ATOMISP_INPUT_FORMAT;
 }
 
+static void ia_css_debug_build_info(char *info, size_t info_size,
+				    int *offset,
+				    const char *flag_str, size_t flag_str_size,
+				    int *line_len)
+{
+	int len = *line_len;
+	int off = *offset;
+	int len_written;
+	/*
+	 * If new line length exceeds max line length,
+	 * replace the last ',' with a "\\n"
+	 */
+	if (len > 0 && info_size - off >= 2 &&
+	    len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
+		info[off - 1] = '\\';
+		info[off] = 'n';
+		off += 1;
+		len = 0;
+	}
+
+	len_written = scnprintf(info + off, info_size - off,
+				    "%s,", flag_str);
+	*offset = off + len_written;
+	*line_len = len + len_written;
+}
+
 void
 ia_css_debug_pipe_graph_dump_stage(
     struct ia_css_pipeline_stage *stage,
@@ -1194,123 +1220,52 @@ ia_css_debug_pipe_graph_dump_stage(
 
 	/* Guard in case of binaries that don't have any binary_info */
 	if (stage->binary_info) {
-		char enable_info1[100];
-		char enable_info2[100];
-		char enable_info3[100];
-		char enable_info[302];
+		char enable_info[256];
+		int offset = 0;
+		int line_len = 0;
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
+					&line_len)
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

