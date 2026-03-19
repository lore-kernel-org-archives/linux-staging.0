Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475DD3CCFAA
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 12:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773922070; cv=none; b=C/sSxl+BnkrnJQ9XHqivCJPQKc/WkoFkbI9thsbkBjhSLzrZRO17/pX+Hd0JE0b8eCe3XCpR33jzemLBioGdXrgosgsSHXfHQmhYYHu/VXHs2PWj3wMRozNYWr325M4v1b4g8buBQ5UBksr1XSRSidzMlTwHzmxiBfSx7DoEAjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773922070; c=relaxed/simple;
	bh=oCf+BJKjheXz+lD/SHSYbVTnBcNiMtD31tBbrwLyCS8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t9T0enCBdjGqf96TX8hntPAHhT+BnmLI+27UmtLL/g3R7scep+niTdHd99fYpx2UFZroDbbTALfa/CdKKaP/u0RE2/STDC1HRdlH7hpiHTbQZcQjdBzN/QzcPd/o2UuVXdzAvH82Zipp88EKaql15V6th0MY7uSnXRk7DQo0nUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FstUwcz9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FstUwcz9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82a15b44c3cso568161b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 05:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773922068; x=1774526868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ehayzYjkEfz8gtyg9iU4hjYqXuHWBNmpMJExrGE8PI=;
        b=FstUwcz9JrmvWelYzW8+htUvQZeX3N7/hUzpvyqSA1OZTJh90xk0gQqT1Xs+k85vcG
         H01+IlTHwsSlOQPT/k2vLi0Rk+abr4n5esuYeFOcSo4jLTaZQgRPqyGBekt5Er/NiNmS
         1TIftj/n6/aWydSnPLfkydPK3IOzB+zKjo1XfExSEmz4IwyNjiiKCYJE7IqsRY0D2R9z
         fAX5GWCVospVQHGNEduXoHLI8JwRVcvXx54LOT5K9mvDhpdGiRYFYszw+ILAc4+FEXAX
         AUjg3oWD4OR8RHNjzsjs2apXw5EFPSR+brrtxoaN8EGC0ll26r7pCt2QjPUMDyHjjlPh
         VsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773922068; x=1774526868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ehayzYjkEfz8gtyg9iU4hjYqXuHWBNmpMJExrGE8PI=;
        b=SEaY/qrIsLhn1FBVLGnSqNYkVge3CTuCTcbexUhGHPrb/Z25pbz+LuabIoIcfFDwKp
         m3YNjgvvp0T9nXpv4+jq9qurylslWMFl5mcWKQviAMqe4qfkewEHpHAZaE4zL8LCNt2U
         G2XVooNcA5ueMcguJ+oBl3g8sgMh9T/LrqIWB8lUJ1Fum5xL+Y3jmi3TWqobhOue3hn3
         pyLHjYc5aXl9wXYC4ZSp/LxTXg1USZnUmpPnPIteAcoHvY6GRp7iu43ipmTN49/eg++2
         fNqRz7gTa/W1/g7SvGd57opDW3Me4N74T4mDo9w8Av0UP2wdh/A/shzkHD89KpLRPE3U
         jgVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtonzLpQHtEOeDJRuedc6kJpKB+9m/4+hDnlu2e/gPpXpGvKAU4gVYd5eUoLzrxmQOV5ak9nw3yFQ9/WEa@lists.linux.dev
X-Gm-Message-State: AOJu0YwmH8C7BaA8V0nM+Xo/kAWlPjVePPDXUo5kwYsogtm+0WGKoqMF
	Vv+TJ74NYCp3tfKWpubKzx7Hye0QuofskpXaNalg8GVPCKEbkWfLt7oA
X-Gm-Gg: ATEYQzxA8TfcB2MUksjZuMkunm/8wQh7HkpbA0FIQyKDMQDU/C4rrCgpxvk72Mcm4t8
	P0Ibkxm6mW7PITGmsZS9qQge4Knd5UefW2yKOaCNWa/A/yDCHy+9Z7DTyyCK1sZpTiYAWjojKGs
	aIkBmznowTOr74LogamdFs05ZCPb0dat8ZBC9zFzB5vZ4Oe4Hm9rWOfhWELy9aCoE6LskpPOdPt
	8g1xXZyaNl4603uC7c/a0G+yZ8+UZOH5D+lbCDRjEt8l8LkXgD0JgcD+jaZEZc18dfl4mDsW1/d
	sBAuMbpCaWqTuDnuV0E5yeBLSSWbOtQ5OhB0q8vJFHbUaulxstS9K+SEICLZZwVfyJwNANKQf4f
	XKGyypQu0QWl/758skbZmcuibJ9Qsi/SmYcAbHaaCI6tTEEUkE/NmmMtHN34MRAVAuu/p4g0ij5
	L8QI43yp8vRU0flebGTjJ7a0bKwSvCYHtXF6tDeZckpslu+gHMemsh5lhYQIrK1+3tg1xejcF65
	V59bCkKqtiIKTVyvg9U6gS9oXpd+VyGmaT1+w==
X-Received: by 2002:a05:6a00:1702:b0:82a:60ad:87e with SMTP id d2e1a72fcca58-82a6adff9e8mr6241863b3a.19.1773922068503;
        Thu, 19 Mar 2026 05:07:48 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1df1-b14e-6890-de2e-81d0.dynamic-ip6.hinet.net. [2001:b011:7803:1df1:b14e:6890:de2e:81d0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bee990dsm7108477b3a.52.2026.03.19.05.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:07:47 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: straube.linux@gmail.com,
	starpt.official@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] staging: rtl8723bs: refactor rtw_aes_decrypt()
Date: Thu, 19 Mar 2026 20:07:35 +0800
Message-Id: <20260319120737.29692-1-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <abus4pKF0ykt6nhj@stanley.mountain>
References: <abus4pKF0ykt6nhj@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors rtw_aes_decrypt() to improve code readability by
reducing nesting levels through the use of guard clauses.

Changes in v3:
 - Follow Dan Carpenter's suggestion to use direct returns (e.g., return
   _SUCCESS or _FAIL) instead of "goto exit" for the newly introduced
   guard clauses.
 - Revert unrelated line-breaking and formatting changes to ensure the
   patch remains focused strictly on the refactoring of indentation
   levels, as advised by Dan.
 - Keep the two-step patch series structure requested by Greg KH.

Changes in v2:
 - Split the refactor into a two-patch series to make logic verification
   easier, as requested by Greg KH.

Lin YuChen (2):
  staging: rtl8723bs: use guard clause for AES check
  staging: rtl8723bs: use guard clause for stainfo check

 drivers/staging/rtl8723bs/core/rtw_security.c | 86 +++++++++----------
 1 file changed, 42 insertions(+), 44 deletions(-)

-- 
2.34.1

