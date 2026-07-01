Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523FB320CCC
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922601; cv=none; b=uk5O3plKFXfUAbxNu779ZFSNnn1pJ8Xby545ladIVgGLqsfSvMQD24AxWT9IQ7CuXinQ+IqLcooVjNYzR23bL3WLhXO7qR0iPycxo8FdMd+kr9zJtpCLAzj51sK7/UL4bK6Cg5kRcGnSDgx2s/y7wk166CoKV4clsL/X1gnS9YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922601; c=relaxed/simple;
	bh=ozpwPaA0w+QjayUfndZNIG8hs+AyrILUcnu2wTnkTu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=djYeagc7mS6DqiH9927VHsdsSxIpJLIfRaiNP+5/k0pc2TtNu61wS13XvO8KHJ09WkNEi71x8YE6loSOG8bcjRJJF240BOuSdbbj0oSdj2tHw84jf1XVRgQ4HGRX66MBWzs0EuuJx6T4r496zV5rn258LE/65RsOKUP2DqsG0Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvzXzHea; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvzXzHea"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37fa897003bso47529a91.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Jul 2026 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782922599; x=1783527399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9duww/9n/zYVsBRyTBQ5AEot5qHPgR/+kguChkwrIaQ=;
        b=NvzXzHeaI5X82Plf92HwwGZdR5RI+1SspD1l+zlYtkvTw5cx3wHWPsLiMV5Ck6LrrG
         8MzEKVcqmrxwlIbTwl+u+CNb7FzQhDtn2FlZK5cno2Rxi3gZjTB3cZGcJxPzi7dVVhXD
         qpMOpVDqfhy2L81obLHR+IBnHSt9rwKbGumCOr2fSGcAAROfAQltcfW8G1bqRzEKgO/7
         zrlmoA2s+/lSda/N+6ncG5SWFcwkq1iy9RGIeaeygauxdh5ROHFPqBIo/JZCMexgGWlE
         qZ531/V5tzUIpJ+IlwzldmH+Z/0NKK8aJZ7rf2AvSCETfgabYaOOBn4pT8x+iuFSdaQP
         wDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922599; x=1783527399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9duww/9n/zYVsBRyTBQ5AEot5qHPgR/+kguChkwrIaQ=;
        b=f04DxVYnf97v5sJ8pnOBeySKUZWr/aS4N1XYJj0mF/aZiCb5RgI2ypBbVrvBW5R9zB
         dfjgi8vDglVuqurw4D0u085F5X+QAyisjinBZThYfu3sdqMzOevr4m1Vq38b1f6oZukq
         a+FLCu884r8qP3jJVlSZiXHwFysIk/UWxLUwpiDk4nH3bP68ntfbHwVY40ThO61hA3o9
         7KHtkbvjf5upzHVFyGjgbbhzHuh8FTLePgOKqnfBhy78845LyM6e/+DtgzX7qCt3+KQ0
         jHLTr4F+y2ovxAKYaXI65czzZyv6TcCHZpZChSIwye0bGi5lYoi1AWJlxdOa7Y4xN0kB
         YUpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rra8/FBWdP+TmQ4cirKbyQlqnVhkN4IONqRMmvMTexsJIohm8h2t/LPIMwkgT1eRsWDNZdmyWJVU2nZuu40@lists.linux.dev
X-Gm-Message-State: AOJu0YzChjJCW32egxjN7h1Y+4OXtmodLu6kM+9g871WrLT1lMW70bdj
	t4VNG4Gg3oNSh6sG6nqwYHyv+AKz3UbtH5YRl2JXF0/kL+6/CBb9JUOo
X-Gm-Gg: AfdE7clQRH09dyuBbw+SHaasGW2RQvn8M4kbQYc4na6Anu+apE+DmNfWy4lUzpF+oHh
	JYIL9jc7JLg5bxVGzLwYCJjXM73ToS606eKgdidh5E3Ni1PlYgwgY4ptJDVXoNMFmm7mouFsMJ8
	Cr1RrK8ZFeseNxJ3tXntzCUKoHRV0m2TdDkbdUesiOn3JUhqmjXiTko4gqHD2PUd/QtiMs+8smp
	J27F7N2HQZ/CGFMdQ1sZYtg8QQKJ76tzE9JbbwkqwdVFwQCyjkjUl4HAdtFvVlOmzVPrqvKB9pL
	hxJNtOKWBQ95jS+Q26F8R4+tqLGTXHLwxG/UCAcsTWU1eCCHZZ6rTeysAW+0wMRgCxwmmsK/od8
	QE/QvMdIr4v6rE6WL8nT1GF5nScl1AbuDx58lqQLlrzhWwVsW641Q8eCqNl8k/Wh+UwDG3UNTtn
	Q4a+Kozei/
X-Received: by 2002:a17:90b:5386:b0:364:be8f:1d86 with SMTP id 98e67ed59e1d1-380aa2978d3mr1352639a91.8.1782922599407;
        Wed, 01 Jul 2026 09:16:39 -0700 (PDT)
Received: from desktop.lan ([2600:1700:78e0:fd0::14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fc21casm20898228eec.10.2026.07.01.09.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:16:38 -0700 (PDT)
From: Neal Patalay <nealpatalay0@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	matt@mattwardle.net,
	error27@gmail.com,
	mugrinphoto@gmail.com,
	Neal Patalay <nealpatalay0@gmail.com>
Subject: [PATCH] staging: media: atomisp: refactor pipe graph dump stage formatting
Date: Wed,  1 Jul 2026 09:15:34 -0700
Message-ID: <20260701161534.31152-1-nealpatalay0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original implementation of ia_css_debug_pipe_graph_dump_stage()
includes an off-by-one error where the original strscpy size dropped
characters immediately before newlines. It also allocates over 600
bytes across multiple buffers on the stack. Address these shortcomings
and reduce stack usage with a single 256 byte buffer via a new helper
function, ia_css_debug_build_info().

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Neal Patalay <nealpatalay0@gmail.com>
---
 .../pci/runtime/debug/src/ia_css_debug.c      | 174 ++++++------------
 1 file changed, 59 insertions(+), 115 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 5113aa5973f3..9b4dd3b429da 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1162,6 +1162,25 @@ void ia_css_debug_pipe_graph_dump_epilogue(void)
 	pg_inst.stream_format = N_ATOMISP_INPUT_FORMAT;
 }
 
+static void ia_css_debug_build_info(char *info, size_t info_size, int *offset, bool flag,
+				    const char *flag_str, size_t flag_str_size, int *line_len)
+{
+	if (flag) {
+		/* If new line length exceeds max line length, replace the last ',' with a "\\n" */
+		if (*line_len > 0 && info_size - *offset >= 2 &&
+		    *line_len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
+			info[*offset - 1] = '\\';
+			info[*offset] = 'n';
+			*offset += 1;
+			*line_len = 0;
+		}
+
+		int len_written = scnprintf(info + *offset, info_size - *offset, "%s,", flag_str);
+		*offset += len_written;
+		*line_len += len_written;
+	}
+}
+
 void
 ia_css_debug_pipe_graph_dump_stage(
     struct ia_css_pipeline_stage *stage,
@@ -1194,123 +1213,48 @@ ia_css_debug_pipe_graph_dump_stage(
 
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
+#define ADD_INFO(flag, flag_str) ia_css_debug_build_info(enable_info, sizeof(enable_info), \
+		&offset, bi->enable.flag, flag_str, sizeof(flag_str), &line_len)
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
2.54.0

