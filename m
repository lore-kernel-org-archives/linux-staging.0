Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED482307AC7
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 04:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783485037; cv=none; b=UqPIorloOZ94lgBg9RcJmdJjFxB/YpaeSljMe7oLxMEj7lYBa7u2v/kjxgwiul4koB845m0tHWEAhVOcxdZr5YOVa29yp7JVAuYP8oW/mgMkw2GcOzEuH2U5+uvqH0ixw6RHYjXzotteSpwcNcMQtVdw0qllK+WbsXowKuBSDPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783485037; c=relaxed/simple;
	bh=q9e7v5hnotE3cx4kjW2kI5fs9AKp4lheGRDb40amvh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rd7QRdvmWlZEW+wSl72tFqdxjAYGBpgiCbFw5UoMSZwpC+8fNr03p999UXPxZ/bzcyt+iq7BwtiKBq9JfCOtEH46TvKkOb/k2v6/mo/7j2A1j/SSy7RXcBLfzF5WPo62YoLwQrDN5Z25b1u0nTbO+pd+cUsjA3d2eHws9IpYTMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmRy1jsB; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmRy1jsB"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso22484a91.2
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 21:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783485034; x=1784089834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPK8V+IueT5TCH9i7GirtjFyF+3KEvTuk3MZShfYogY=;
        b=kmRy1jsBKXTrMgWJc/V/mG4DWExIW9Zz7iJj4gzYAr0hnek6FGpAiEbGtdcz6TzjaB
         HanKpMfgMAUppFq6jNg0Ost4ppN2VIuGAChZVR4m8e038SdPUYy5iU3pw1TXVcKUj13Q
         ALp/MY9z+2Sdz822U80r2o3Fd72L95M8QfVF8rcTIlnZmDxa3O7o0r6ow3QmXKBIf2Ke
         uwV6LKuyi02Z+Z8DRLCQDlzLq/Fjs9RDFtTCM787JMnou9MpxrpoAUCLbAvSwBmsTZCX
         iXpUjaalyp+UFtgx+wJ/nXgI46j0O5J09fj7v5iKdUKbNeaxkT/TiuXzmIXpXhOgA0zy
         lgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783485034; x=1784089834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPK8V+IueT5TCH9i7GirtjFyF+3KEvTuk3MZShfYogY=;
        b=g1/zSdIlEonw+/9y0z4gTEYfEpSj2xkyc3sYL/21NeCPbPUhdGHsYq2aNeY4qSGm+X
         DsWaDt3nfhR6l/1wtUI1sXatNv+ogi+Uzj1d0z4aGwdNgBebM6H8dJAM48aoArSpMIaM
         jHgdU0lC4wwb9bopP7EpLrDJneSAd6eJreBVj2cAljsbkeS3NTn/ZciEiogXL8BFtgXm
         P6tg8VHFQGFk/wVlw5xvOYaanwUqHWAQniGzsrepzGfyMNov66dsUDvfZbI8YHFbsvPU
         yd8APnFwdFPXIxhsbH+P7cP+YXRDPtIjV9FoU71L4UneO1E3mYspRiGQuBa8xV3XLZ0Y
         vqfw==
X-Forwarded-Encrypted: i=1; AHgh+RpzM5YF9Hank1RkVo9xHbtJ2Jq0XKEf0X3Gu7Qy0ojLw64hnz1btIVyIWFre5sSFv8Jl88XRNHhPCkxVeSX@lists.linux.dev
X-Gm-Message-State: AOJu0YzGRyVPmwjrlSAGanih+nP0U843apLOb5SlZIV/eZLjTXV1kB4s
	VjYxGaGn2scnlTX77gRRE6WbuX9CMzjfbJgG8rKBluzIrFGcDUCjoo8q
X-Gm-Gg: AfdE7ckMcCptatPIgnctxMD2TfSG6Pv7T4gqrwwHmREcWhepXy0UioR0+6CSSE7hASR
	m46AZU4HtOob/JzffNT0umlOs5WL3m21+I6V58+BtKZ79px2ug3OAiRKpc/JNacwFV421yC6A0I
	Bn6VrzRUx5v76qmjcdQ0O4BLYIJJM7sEl8EY2dWrQmH8jG7ufkmthW2Bxvv6bqLZ7SXYI3KAfzG
	vWS9hicc7OdYuRq3+dsvdU+w57n2i5TaLd1dxe3wrkLCSeqZX2rwJjmy3361wfCyIBJL3b7dusi
	ZhOSfaW99CN/Z4zikSdXVdTyS4mrHeQuaazbnppQGW8lTzwoKBR+VXsgI36ceQtVghZ203yye0j
	FJ8O99qP7/rjLwp6n7oVsXB9bVft4lGmFNVUf8UaxxvLChbtcObMaqJNhhJN7hiQtZUqIxkxBdA
	==
X-Received: by 2002:a17:90b:17ca:b0:381:abcc:c8d8 with SMTP id 98e67ed59e1d1-3894014e3fbmr760905a91.1.1783485034159;
        Tue, 07 Jul 2026 21:30:34 -0700 (PDT)
Received: from desktop.lan ([2600:1700:78e0:fd0::24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm7598852eec.21.2026.07.07.21.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 21:30:32 -0700 (PDT)
From: Neal Patalay <nealpatalay0@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	matt@mattwardle.net,
	mugrinphoto@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Neal Patalay <nealpatalay0@gmail.com>
Subject: [PATCH v5] staging: media: atomisp: refactor pipe graph dump stage formatting
Date: Tue,  7 Jul 2026 21:29:39 -0700
Message-ID: <20260708042939.40420-1-nealpatalay0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original implementation of ia_css_debug_pipe_graph_dump_stage()
includes an off-by-one error where the original strscpy() size drops
characters immediately before newlines. It also allocates over 600
bytes across multiple buffers on the stack and truncates all output
debug information after three lines. Fix the strscpy() bug, reduce
stack usage with a single 256 byte buffer, and remove the three line
limit via a new helper function, ia_css_debug_build_info().

Fixes: 662fb4fceb1a ("media: atomisp: get rid of a string_support.h abstraction layer")
Signed-off-by: Neal Patalay <nealpatalay0@gmail.com>
---
v5:
- Simplified by removing truncation logic and offset check
- Changed commit message to reflect removal of truncation logic
- Elaborated in comments and documented offset behavior

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
 .../pci/runtime/debug/src/ia_css_debug.c      | 190 +++++++-----------
 1 file changed, 76 insertions(+), 114 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 5113aa5973f3..5fbd37ba78f9 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1162,6 +1162,34 @@ void ia_css_debug_pipe_graph_dump_epilogue(void)
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
+
+	/*
+	 * If new line length exceeds max line length,
+	 * replace the last ',' with a "\\n". Invalid
+	 * memory access via len > 0 && off == 0 is
+	 * impossible.
+	 */
+	if (len > 0 && info_size - off >= 2 &&
+	    len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
+		info[off - 1] = '\\';
+		info[off] = 'n';
+		off += 1;
+		len = 0;
+	}
+
+	len_written = scnprintf(info + off, info_size - off, "%s,", flag_str);
+	*offset = off + len_written;
+	*line_len = len + len_written;
+}
+
 void
 ia_css_debug_pipe_graph_dump_stage(
     struct ia_css_pipeline_stage *stage,
@@ -1194,123 +1222,57 @@ ia_css_debug_pipe_graph_dump_stage(
 
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
+		/*
+		 * Build comma separated flag string word wrapped at
+		 * ENABLE_LINE_MAX_LENGTH characters using binary_info
+		 * flags in enable_info buffer. enable_info is used to
+		 * populate nodes in a graph visualization for debugging.
 		 */
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

