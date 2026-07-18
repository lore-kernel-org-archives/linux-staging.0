Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56B332D43C
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 18:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784400922; cv=none; b=lKRdDz2PoXwyQKdQs8sTosV9b1RCBTEhAF2YR+3B0bgm4/MSahChqXzLU0t6iqeGYZ1+SsBA2AWKXEUCUjSbYAdmDS6dXb2536P2m/YFvlnJCNiyT30RtB6qvbEVdnWllzjIyIMNwHH7/CdeE6GAdB16hYJOmSDGpkKkWhndHtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784400922; c=relaxed/simple;
	bh=bCImW5FveOgLSFMnd3wYiHnrEIorbTiPRBOU3dDrN38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwBam0FSpH9hopsPHq/hG0ZjJRhY4NgmWz5Zmg1NtVd/scKCBJHEPn4F82l66q1oSdEGs20on43GRb4KRAGLB/eZWhFXMq8++j+8hRXyB0SrjT/Jh936+mDFUpN1dH/ufy8TgRWF6mslwexfkeAn1W7Y2+9i2F7dtBPUBPa1uEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5AnfrJ6; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5AnfrJ6"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1740c36c5cso218291166b.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 11:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784400916; x=1785005716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3K1t70zaHBwvr/zd5QGdCAYVOIE1pLnv+eQf2gzB8Y8=;
        b=K5AnfrJ6eETXdnRT7KbX7R4QX9PP5DeNTGNLiBuv/oE/vmOFYSFje+K+6MIiCWnsS7
         a4OL+Qkff0Arz4teimHeyXBPhE3I0RzsYhJLm8ZVuRXHeoyiFyOBhDDyJHGaqHL2cNBv
         QPaDp89dqCa0K8vGrwlhmlJUNzQpEBe7xk47aoK5YnJ37/xq1SvrZRZM8ub5grefwnem
         dWF23guMIvUoIgNn5A1ry8Abk+aj48YDNrowC4FByhJeFdmvmxfzRhjNUFZCoVlrj+gq
         2zYf0SdMiXrNSc11vN7O34vwuxFRrli+MVLj5YHOzNNr+KfHwJSdzcpPWuxDUPY/mbLi
         j8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784400916; x=1785005716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3K1t70zaHBwvr/zd5QGdCAYVOIE1pLnv+eQf2gzB8Y8=;
        b=QyxmQz6cZDgkD+lOyHM2g+1IWYOycYEXw2KrobCvweoLs9Dc5uc1DZBVqLlsrrAJSR
         TRPd6UxBhnLoY13d/sHuLJTw9JLmRQv18piVCIvpX9elujFbeX8RXl7BlYetyDI5p9tm
         2vPJJnUy8RlZVVxivrIbu2RZU2H4IE1o7gfXyqkJEE8GQJ6cnL60Jb00GqY0/JYojs5c
         PG6paMaL5tN1cyWBHFFhmIAAuefv/xuOFlQQf1KKtUOQRgZJbCI59nLSY5y7e/8N0RjR
         P35WqG/XJ+ctNFPkXk6jMeAsFF+guQDvev8fOXbXc6LCodQymErLZzb7ymOAo3qXv17M
         u20Q==
X-Gm-Message-State: AOJu0YxaFf2MH9PQOnbR6/5/ccnt9rRFQ0OuX/xB+PviduR/VdQT1P4G
	MqPrj88MlxjeJzkrXvib4iZizQ8pn/NhTwylWYbGCiH/ucowcqWDidAM
X-Gm-Gg: AfdE7clWhw3kAMCGSA/lJuq9Dz70iJFkc4j4i3x1SnC/A5fBRv0QXebDiIDSQfTbah1
	0DoMJxhhJDXn/F2FfPunoWYuuj8r0gs5fh+jNibKmOwX5yfEEkT4eM2BPMLj6nHc3zxOSB/PNwL
	ac1sjYBZHdfeIUNNXLZ4/Bni8w1OnIYs8Opb8RTobimkE1YWnQa3zSP3l/YWv2Dk1xXZKqbptVz
	us+F+pJ2T8YZbZkfF2Hf2N+bZU3h6ig0gWre2dAQEcnf9pCCc9RJHWdKGzj/7tzWsXQ1EnHwPUY
	2b3ZApuoFUfEBXfsK9xX2rMtHewagEC+9mbp0AKCmEuk/JF9xdkUCW4BEL6BBbQbeL+4dj31w0E
	6ryn0uHjSAZfn8DGzFUhY4F1w+KrEKzucsOPUJ9sPglEWQIq2cyIy6ES9T8Qwt5uG/KXKbnJpHs
	5obWB4UgFGUUi2PHGkFkDRWAIsS0V00nyKnsaa3IkNNVmsDgrUo86gI+g=
X-Received: by 2002:a17:907:c8a4:b0:c16:af70:f981 with SMTP id a640c23a62f3a-c16b48551d8mr273271766b.32.1784400916066;
        Sat, 18 Jul 2026 11:55:16 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f837sm249151866b.32.2026.07.18.11.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 11:55:15 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH 2/5] staging: rtl8723bs: fix OOB read / stack overflow in rtw_get_wps_attr()
Date: Sat, 18 Jul 2026 23:54:42 +0500
Message-ID: <20260718185445.63070-3-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718185445.63070-1-meatuni001@gmail.com>
References: <20260718185445.63070-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_get_wps_attr() walks WPS attributes inside a WPS IE taken from
a wireless management frame. For each candidate attribute it only
checks that the fixed 4-byte attribute header (2-byte ID + 2-byte
length) fits inside the IE:

	if (attr_ptr + 4 > wps_ie + wps_ielen)
		break;
	u16 attr_id = get_unaligned_be16(attr_ptr);
	u16 attr_data_len = get_unaligned_be16(attr_ptr + 2);
	u16 attr_len = attr_data_len + 4;

attr_data_len (and therefore attr_len) is read directly from the
wire and is never checked against the remaining bytes in the IE
before being used as the size of:

	memcpy(buf_attr, attr_ptr, attr_len);

Since attr_len is fully attacker controlled (0 to 65535+4), this is
both a heap OOB read of wps_ie, and, more seriously, a stack buffer
overflow at several call sites where buf_attr is a single-byte
stack variable, e.g. rtw_get_wps_attr_content()'s callers passing
WPS_ATTR_SELECTED_REGISTRAR into a stack "u8 sr"/"u8
selected_registrar" (drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c,
drivers/staging/rtl8723bs/core/rtw_mlme_ext.c). A crafted WPS IE in a
beacon or probe response processed during scanning can therefore
smash the stack of the parsing thread.

rtw_get_wps_attr_content() itself has no independent length check
and simply trusts the attr_len it gets back from rtw_get_wps_attr(),
so fixing the bound here also fixes that caller.

The "attr_ptr + 4 > wps_ie + wps_ielen" header check above was added
by commit 1463ca3ec6601 ("staging: rtl8723bs: fix OOB reads in
rtw_get_sec_ie(), rtw_get_wapi_ie(), and rtw_get_wps_attr()"), which
bounded the fixed header but never extended the check to cover the
variable-length attribute data that follows it. Add that missing
check before attr_len is used as a memcpy() length or accepted as a
match.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 2fb5863dbeef..be374d222c55 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -733,6 +733,10 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
 		u16 attr_data_len = get_unaligned_be16(attr_ptr + 2);
 		u16 attr_len = attr_data_len + 4;
 
+		/* Reject attributes whose claimed length runs past the IE */
+		if (attr_ptr + attr_len > wps_ie + wps_ielen)
+			break;
+
 		if (attr_id == target_attr_id) {
 			target_attr_ptr = attr_ptr;
 
-- 
2.55.0

