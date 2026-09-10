Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1A044F56A
	for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 21:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075973; cv=pass; b=sHduq1PjJOhkVk4EeUclstnoip2QcjfuPXt6vYVbZstJs0Z3UzhmyiQqaLl47LhkND363/fUToCE9PT1JKL5q0LlOkdX/uimtbuoN3qQEoqkNUN13a3OoKTLFfV8lefX7Y7sD2annT7uTQgdWjGOPkSynmnGOvFVWLGpyCjMBTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075973; c=relaxed/simple;
	bh=ufzXj+hMnVisIYQm5mhRNXlmSHJ4HDjMJXpa9IW83P0=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=FSYnzXEjPNMkXe8wPvvbv0Ey7CPCbIsyBn8TtAELr97c7KHRFwG82Mz7HXB2ME/yYOjptI+ygYt0+PX8HS3FmRxQG8rfPTWR6mG2PnhA9Oz6do92RbXstOJQBE/bHno5+4SzIDh4HpSvBkfFIXtlR1vTPw32dy4PVkQh0EAZTKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=JlQQ9Xl4; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="JlQQ9Xl4"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398b3d66515so271951a91.0
        for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 14:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789075970; cv=none;
        d=google.com; s=arc-20260327;
        b=R6HtBts7WgVZkCG9POeS21mQ4KQxM4NuKNYtMCOGHZSzMdCK9w6iI2u5dpN1aSBRGw
         Gbo4n7zsVcJ06xglNfNU6d1F2c1qEuWRgdPIJRZ7/nrQwi3HamDLXteXV2eF39cbi24o
         vYJsavxB8eOIqmM1sBbAa512t7QvQqNpIfTN8iBr+UfUAi+L7AKEIKo4F+pWaBGvJyk4
         82g5JWpvmvqX3uFVVuamhlczXQjt6ZQ7KZ0ne5UmjUHaTwyb7Fhxx26hh3KcUyC2wQGz
         pIoI3irQdv2meTMRwo5AVXeDm/E/obu/38VEycIKTf3BH4/tI85mLyol+eOmD/c/Jqm1
         IByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=9LB6NWq/tHXmFqInVJbuTy996SeIixGc0WUFWyc5Eps=;
        fh=Iarq2NdK/pa8YKF2J1U/n78Kbh4XamPWgevgrisoHc4=;
        b=XKq5NJpJ7f98LufWHmeSG3H7iUVohC9gFEvVzI2UEw0CNmiRn6w5XovJG9fyHPRcuS
         XCbPsLnb9maj5cWpXBYhLAVkYmr0BS86i4hGc3tggYLJKWKwfOPIbyA28UGpFm1/hnDJ
         0RVrvaVgC/5gTIBjs5GoJcHIzDWBR6zJPB4qQ0R6FT1eSPQy1sL6AFEDzHW4djh99F7d
         pKgI5M5jNRgLoc04BQlltOFlJpcl3OcNA6U09DCft4tekIwCwT6gBCUWH/jSAnHadt3S
         yHbCVEcsy+5a+yN3tGhHn6mgGQTV0BVuKzNJigi6ZzSHfRDikFrAh65SoAH0Oo0nb21E
         cJWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789075970; x=1789680770; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9LB6NWq/tHXmFqInVJbuTy996SeIixGc0WUFWyc5Eps=;
        b=JlQQ9Xl43W3qDjemGR9VBx0uMtUS55hY/65UvqVFjLbqjoCIEjes5ARKxQ/AeaFOZ/
         k0RHWubDYB21zZuJ3jkQfXFzBsV6EEz5ly9KKxYG7uaTjj3i4Cl7svSQXWkjeq+IHpUi
         YTT4jINTXb3106wWIE9EbO8x1uTzpyzhb6ROT1Km2oITegx1IGfQtG6v3zgmO7/jyIwF
         iH934/58BW2ghhviaNam6Dxh9+t/cqE4DO+sLz+N7JNIip1EA8u01LqC7xYjjC3H3LzU
         +Uw7Y+ULKkOZVtprrUlEE76wUdmcS2K0ICevFXOhBDzjSyY21q8V+/vIvOMcfRD8VqSs
         S5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789075970; x=1789680770;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9LB6NWq/tHXmFqInVJbuTy996SeIixGc0WUFWyc5Eps=;
        b=EEL/dwdFfpgFlYXaxDU5StjirmtBNs9zfMxEFGpZMXSrNuJv5zCJQrmyCFCALRamTy
         rWkYgcgru47nkoqSENTLg3XUsmmOxHfDQ8MVF4uDrL5I8J+boqIr8sLtk8Lq3OEtLT/p
         +I+6xq5wAedatua4mKU5s0M8NJqGPbAqXwtiW9xAAfdfOZrhIK1KBxMNvST8HvuhotLe
         Bv/JzoAFx0R3OnQk6IZSY5vsW8j3RlBK3rYgr/MfVEAI9Al//OAYxix2WUoMgTjZEaAJ
         8ex8fiJCtRpCm/qgSpzBrpPBl989hqOipUwf1DvDk5h/lZJc6s+b+5YZ3BBw37WZ2jnx
         0Iog==
X-Forwarded-Encrypted: i=1; AKwUvBxefBzN9QshcUa84yMZ8KmucDKQLt+9RcinJj/HoSuO41N6mvJeQsMlvibkAy5XIeANYg6IdHWvtMVcmuuE@lists.linux.dev
X-Gm-Message-State: AFuF++nFw/NQk5JoDWi4byuWdtcM97GVikBodZ1KZMDIPmZ9uItNM1Tn
	LZGEHucMXkmjffa/i1un+KkkGMMotPKOtJCqzW/gM9dr1LLntgpyMDI0rcf5cS6hGnsIvxdwn9e
	Bk14Xzx3lATujKtiXE3+EO2W+a/IgDaFyPxHGGz8y
X-Gm-Gg: AYBFou1UrjikFK/hyrATYQPhu11FvHCZ1oiLLPH7UPKyVhWr66qHzrCT6Asiu2JYGBD
	Oag4jEZj7zJTnZvgCS2oB7ed36h3MixIEqKlqH2PgKjSpqulFT2G/ek1Tz9itZgw/+iVQz8o8LL
	pgvcNXamlWlCo2kzs9VlzKdb/Gg5bNM9cockme+ki43laMcLlpPN0C3StcUH45F/YQsySAEmx8R
	SsFZ7LKmKYO5Ba0ujAxKk4v9itzKoaLyw1PAmMjsfAFmEAoSV+/+z/wxJgEC4qVUfz2GLL+yZP/
	4tyek0dHgLrncGzuc0pNa/OFgOX0FKICogwmbIXIQHoyUooKwp7+/Vroyy/hvAIMD15P6Yy7P+2
	jxYMXVHJxo1HmcqQXCTw5MDac7uWRbsLMW6WTRpg6NTC46VSomjZb7A==
X-Received: by 2002:a17:90b:2690:b0:398:9c00:29ec with SMTP id
 98e67ed59e1d1-39d9c34b15fmr1113138a91.20.1789075968819; Thu, 10 Sep 2026
 14:32:48 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 21:32:47 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 21:32:47 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 21:32:47 +0000
X-Gm-Features: AcwNN1URJux_fomBEWD1vunfK0R38yI4yB1kHbbH6cW7X9Mqo9UdmM8PR6cgrpM
Message-ID: <CA+0ovCirfyOhrXdxmM3ri9-cShD0mzPptO1qtsaboS1xscaM0Q@mail.gmail.com>
Subject: [PATCH] staging: greybus: hid: fix off-by-one in SET_REPORT allocation
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
Cc: falemi@asu.edu, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

gb_hid_set_report() sizes its request payload as sizeof(*request) + len -
1, but report[] in struct gb_hid_set_report_request is a flexible array
member that sizeof() already excludes. The buffer is therefore one byte too
small, so memcpy(request->report, buf, len) writes one byte past its end,
which KASAN reports as a slab-out-of-bounds write. Drop the stray - 1 so
the allocation covers the whole report.

Closes: https://lore.kernel.org/all/CA+0ovCgLrz4WhPKP5LGW5HZa8VOodgeo6pWuyQGgHE7UY57Oog@mail.gmail.com/
Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
---
The device was emulated.

--- a/drivers/staging/greybus/hid.c
+++ b/drivers/staging/greybus/hid.c
@@ -97,7 +97,8 @@ static int gb_hid_set_report(struct gb_hid *ghid, u8
report_type, u8 report_id,
 {
 	struct gb_hid_set_report_request *request;
 	struct gb_operation *operation;
-	int ret, size = sizeof(*request) + len - 1;
+	/* report[] is a flexible array, so sizeof() already excludes it. */
+	int ret, size = sizeof(*request) + len;

 	ret = gb_pm_runtime_get_sync(ghid->bundle);
 	if (ret)
