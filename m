Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4209236894C
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091845; cv=none; b=TvUenGOLA1EtDMjdsDyJSISa3TJFhaGxrxLoCe/IO5CpWGikT5US6kgi7I3MJqMv55N5Xxg/vlm/czhVfDodN6ECM9VYEswBrCQzEDkc2T4GQXi6L63i1mwubjPoCV0ZgkIIl48Dp3M+zoZel7kX1xJealtD7ZV+rUFSfCntzBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091845; c=relaxed/simple;
	bh=yka7phzLnONh6hl9LHa4rhg61vq9mVyx09pSbZVKhmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jiEzu5Hw/1oWLn/8nYCCfjC0eCmKK3TufhGifd17sL5C/hd+erOb+YT7V4RDtO4mwYtdroB94LhWymsPoUWgHSKUY++5XO1vt2U/eUsjZxlE7O5nzy2GjioYLhaMoNArBMYW6Jw1WfHK1RPetxQ8RmEwaDneGF64ocaXamxm6D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VybTvS4p; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VybTvS4p"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a26b4d830so74714391fa.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773091842; x=1773696642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tUXcmvYUC1iJtrOU7nBokPHcMTtgoScFkvovIKTazVc=;
        b=VybTvS4pf88b7APzabrMByGg5dFECgNllu00Mb0NM9/S4Og8kHKmEXH2i339wQOxOJ
         3ZIWvd9Ji/KciG7h5eNetAD+tsCVWqpP6cLP9I2OcFpnK6dYIcPJcA3UAnN/T/8bIv8a
         KjA+jP3ZxxaWX6gqynHo4Ad7onJLUd2ecwPoV81WT96atI3B7/+e6lVzhgktLl/MO0io
         BIdFHknOt4xj3fZZNd+NpiNxCi7/gGFFnfAfsAxe/m6fNsiiNpGub2cA8S6zqu4gi6rt
         h3XBdJYwqQrnrG66rYkxA3MEtC4eV6Y4D42A3mdqvgKfcJaxjB2mgo2XKB4C8B1kn7Fv
         +sIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091842; x=1773696642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUXcmvYUC1iJtrOU7nBokPHcMTtgoScFkvovIKTazVc=;
        b=pvYBpRuJIUL2KRdUUKwJjKs47UbY0jZNjGGBVGQCM57rlVUmp3sBXc+wrfRRyK+5Yl
         a8eno1+IC3rKS10qnCPv6Jdzx4/ngGiztsh3OQF3aTMI4JAnnKF1GNYrDWYInRbJQKJk
         GOBIzQtAGsTZN9ELqBK806rhS6LUK3bKJ7/7HezWMsV4OmrGpC/OzUTW/zNx6lPL09H7
         Gpn51cydhPaRiHtMUj6DKo4LtikSmfH64Hxm6Edx404rGf3MzljKfiWzrzwYm4I1TFT/
         ITco/nLLqRsmXoiydxp/SbtsIrAFIAyySF3Cic7cwScGS8HsKhxxEDsGXvNqvDt0jBJi
         VswQ==
X-Forwarded-Encrypted: i=1; AJvYcCX31sGxMMxRxTZGvyCWwsoOjfhna8a/ht/FzYbxvm/OCjikBwH3usc5xIrnbaMVlR7XPadGULJusO6xMoDW@lists.linux.dev
X-Gm-Message-State: AOJu0YzLU70Zr6lB3QgvJUuR+Od5kYl9FNtjrf2P+dVkGqQSYuTnF33x
	XXeUcVr4ZbdpwJhCMn+L1QNizVGX2c3VX65jq7+T7jwG/2O+rYN1NdQA
X-Gm-Gg: ATEYQzxYDYPgo4Y555UnnqsQrlJf0fAUL7XL84va+xK53+v2j5xwt4Rg8K6FgrIeV0J
	E9L5dO9gm0+GYKroNrFhQHSCiXSdVKzQAYhdZWp7yFYJyvj3ACqGBuJSy07sHgyT8vuFsnXKgMd
	kyAvn9DdyRrc6htmppsa+ZbDW2j0b1LyPzsVtmR11h9eSkc9FahNhYTzZw5FaIAFoilvUICCOn6
	YIPKkaltCm2kFNQsYBBku7YY1Nt/cyS401itN5FvN1RMZWrjSkyuKVaZeXv3z/Qc1sZrhbv3Dd6
	/dXUzyQ0G3GueH/E4o5fhIoZ4kUNR/TYmnsagZoUT6pLcw6hXu3+RpfI/zhIS5cXOD8K58habsI
	hbTN/6F53bokJwpkuJnWKu3FDWYwyqobPYNeAEvgPAOklLmfuzBqiUcUfA9shtxtp7IX4BxBNhO
	mvqYInloP3biHsk885e8RWYuQY1rbFSd1PpFAxb7uv0UzAjbwyMSlhzpzIybew1AIP019QiQqFH
	w==
X-Received: by 2002:a2e:bd06:0:b0:38a:4106:5147 with SMTP id 38308e7fff4ca-38a410656cemr35586661fa.14.1773091842115;
        Mon, 09 Mar 2026 14:30:42 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5d046d27sm1243231fa.28.2026.03.09.14.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:30:41 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: fix block comment style in circbuf.c
Date: Mon,  9 Mar 2026 22:30:24 +0100
Message-ID: <20260309213024.5733-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 .../media/atomisp/pci/base/circbuf/src/circbuf.c  | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
index cb34d0b5abb5..db0b76ea4a29 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
@@ -192,9 +192,9 @@ uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
  * Please refer to "ia_css_circbuf.h" for details.
  */
 bool ia_css_circbuf_increase_size(
-    ia_css_circbuf_t *cb,
-    unsigned int sz_delta,
-    ia_css_circbuf_elem_t *elems)
+	ia_css_circbuf_t *cb,
+	unsigned int sz_delta,
+	ia_css_circbuf_elem_t *elems)
 {
 	u8 curr_size;
 	u8 curr_end;
@@ -206,7 +206,8 @@ bool ia_css_circbuf_increase_size(
 	curr_size = cb->desc->size;
 	curr_end = cb->desc->end;
 	/* We assume cb was pre defined as global to allow
-	 * increase in size */
+	 * increase in size
+	 */
 	/* FM: are we sure this cannot cause size to become too big? */
 	if (((uint8_t)(cb->desc->size + (uint8_t)sz_delta) > cb->desc->size) &&
 	    ((uint8_t)sz_delta == sz_delta))
@@ -215,12 +216,14 @@ bool ia_css_circbuf_increase_size(
 		return false; /* overflow in size */
 
 	/* If elems are passed update them else we assume its been taken
-	 * care before calling this function */
+	 * care before calling this function
+	 */
 	if (elems) {
 		/* cb element array size will not be increased dynamically,
 		 * but pointers to new elements can be added at the end
 		 * of existing pre defined cb element array of
-		 * size >= new size if not already added */
+		 * size >= new size if not already added
+		 */
 		for (i = curr_size; i <  cb->desc->size; i++)
 			cb->elems[i] = elems[i - curr_size];
 	}
-- 
2.43.0

