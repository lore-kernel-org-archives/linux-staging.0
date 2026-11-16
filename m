Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830835;
	b=uYGiEZK09EROTqArr9YArJFJRbZDusRku9VXdAbLVVOcjREdxnqpBYOOEL4iUo68p2Bb
	 LIjKQyzDB6ZhC9YvoOV6g+Lf/de5MQZdyHeC+nxLzI527pFUv5OacKs70d6KuUYwjnpLY
	 /Os46za6/OmLonSxUbwAkCj+uvzqUQXub11BkAQLBP4zYYCHKNWmbAVxIiN/qPwuRsuif
	 x/RXIuFDLnwaaFJM8vmHRjPKdrZ+ZIE/Qz7gBTA1yXkVesCyVdQxSfty1hABCtogpGrQC
	 j3q9faBEprGOk7U5y02LaT4E5hI7pOTzynYWSXlrx8TJmwoyrGmhfl61ipW2s88PSEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YTgCfMhAtura+nyFnS5QD3/WgVT4AUiTNomC6btACpw=;
	b=nbC1XE2dF7m2qzLWHflCY7+981SKBKOTaKouqmLgJQkNMSFujrRm70kAkvy1Y8+qNMED
	 rPASceLbwkGLSJa3SsDD9kTJsp4hSBP3v0k0IYciDp13Fln1VvrrqfPF+jZdRYmybAqh2
	 J+IMbOEPOBCpjNYV6rBKM42FaQcX4V9aKRw9ReKHcsFsg9FhxY9TMQMO7nbuKgx3HFJsO
	 LKvnNi9ySJhJEbiq1RMVbc613VK5HIIvuxsY2h/a+vmR+Tm1cFsh16bkTXQjXOUb6CV6K
	 L5X0FK7SxJW2AKPasR0Jg95LD1D5glWsqGDR+MJIlFR62xfrSCGBw3OSWK/fg7KyiLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kw9OD3Ur;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1411606A33A
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 12:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1411606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kw9OD3Ur
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so3730897c88.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 04:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830834; x=1795435634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTgCfMhAtura+nyFnS5QD3/WgVT4AUiTNomC6btACpw=;
        b=kw9OD3UrZjIxXsC2t7uuGWzrClmO7sRh51Xdi2oFgGAtIq7xQ768lLPd45rBqH5t69
         jm2r4302+jC873ITlZ9jpPDIFKIk7LGSb3GiNnCU2t8tMcmPjfzRbDVkn8DsDxxBCEgI
         CFE/8CPx6iykrxkWuZJPEA93ympa2sbY0R0/aIGkrOUOj+wnGqi/09wpFL1Nv/R0fwZu
         ZWDXcxj3fcNNAkwsi2ij1eObACDelX5+4cTwpXRhEo7cDQBW6n+BlC5SHsGuPXju8ZbF
         ngXOgdqofREKQWKphRl+hUfLUsMEHr+olblwOoGo0Qjd56eeT8TQ0AUWZu2FKbjDb5am
         bFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830834; x=1795435634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTgCfMhAtura+nyFnS5QD3/WgVT4AUiTNomC6btACpw=;
        b=deLeSC74hHlwGrOcvjUOZ3c42M1UjFIDIgt7uaB+TPYqs3PLgD6Hzo3jtQKbkUQGHr
         LCFUKecSrQ613qDOr03uVSW1Io9DhuRGnTAJ+6sIe6Nhy816RVeiuG1sWB78gjvv0dMb
         hcd6A44QIkKn2gVRUfdIiOGbsNT8Msa6ySPh6Db5mf89y+mQyJUjUisFU5naZKwBBHrJ
         BrZ2LKnczEA/OZj+eIWDMDeeudYByVQzh9K8MMyEUjR1ZPeiKymYicLIPQEjf0tG7mid
         rk9gYH5TeqsboPb895J1mox10mAhe33SQYGJVRj6NnLC9ISW8KzLHPgVbYEOFQj5RAfj
         NaeA==
X-Forwarded-Encrypted: i=1; AL+hErEYyHLUnAGi1GiIJZpXmbY5WlmtQsLkKQnfE5P7JuwD18OWcy3VpZcb+F8ij+20/jXgCJDZKC2t/cPpn5Wl@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZeWrBgJLmRk0YYfb0jS9z8UFtVw2nXsJ6T7tXzNDiQVRDCZdg
	vCUGYApaCRlMYKHACm0GGwP1KFQqad/fp3SuP51DbChTGJ/JO5UftlDy
X-Gm-Gg: AYBFou3PtcRUB0l01z3Xj1fguNhcM+bBok3BbLC4LVoG97Unqia/QiA11vpAVTN3A0D
	RLgiOj3Wy4cI1M12a+7oNRbyrrEAWKZ1LHnBnq2w03zKlyyffXhgbyp1Zcxxc+i0UiaERCsMIXX
	htrIdZYTIX0y3TIYvcizTmHZrVfuFsEe30M0K6qLvmfh7pWcRLgqTvMY9G9RQeNi4Y/vw0nh1bL
	inU9U4AwCOWit1C5JpQ2uZCb553JuzxT+FSh9CY9oQWTWXH9AkNWTQS9HiBAR0T39tq4i8CVEoW
	BaFeI34weVh4FnPIXjDQ8FGl0ZvwO08hWm68XKBcZgxZtlCl74N5B9JRexhLtxQx432lJkfaD3P
	THBiEZ5kLc/oFjDIJh4cKjmnNI0l+m5gScQsO71zHI1fPcUHD4mszCRrpcwlhdRQBhqctgj/adX
	u/BG2ZiVPVfP1UitisTZ9d0FuQGYMRNTzatxhz/zXN1xcp7b6ExQK1KPAZwvGGZUcioBt3QyIM3
	/9wbEs6qt1fUOHgaI/j5seH6h8aLnfdrUUNDwA7xIQnyk3Vh8wttayZIIOPZR1JJkEFD6xzsoOJ
	mtaWQD6Ek2LkclSGaS5/ErE3qYWs9o/cmuUStC+2eVoU3wh00d+EmC6hVExw4PgtPXhVFKv8vw=
	=
X-Received: by 2002:a05:7022:926:b0:1b5:2bcb:8691 with SMTP id a92af1059eb24-1b52bcb86d6mr4763177c88.42.1794830833599;
        Mon, 16 Nov 2026 04:07:13 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm32146157c88.11.2026.11.16.04.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:07:13 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH 2/3] media: atomisp: Remove unused get_sp_code_addr()
Date: Mon, 16 Nov 2026 12:06:57 +0000
Message-ID: <20261116120703.6681-2-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
References: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_sp_code_addr() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h     | 1 -
 .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c    | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
index 3cd69284f..e00308818 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
@@ -26,7 +26,6 @@ typedef struct {
 } ia_css_spctrl_cfg;
 
 /* Get the code addr in DDR of SP */
-ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id);
 
 /* ! Load firmware on to specfied SP
 */
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index 78f00f07b..49b986351 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -104,11 +104,6 @@ void sh_css_spctrl_reload_fw(sp_ID_t sp_id)
 	spctrl_loaded[sp_id] = true;
 }
 
-ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id)
-{
-	return spctrl_cofig_info[sp_id].code_addr;
-}
-
 int ia_css_spctrl_unload_fw(sp_ID_t sp_id)
 {
 	if ((sp_id >= N_SP_ID) || ((sp_id < N_SP_ID) && (!spctrl_loaded[sp_id])))
-- 
2.43.0

