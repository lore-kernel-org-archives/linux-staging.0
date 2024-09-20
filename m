Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1AA17CA12
	for <linux-staging@lists.linux.dev>; Fri, 20 Sep 2024 15:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726846520; cv=none; b=vDFN1BI57QDRoIhKf7AlwhdgsMc/nitS998qrGhZ/1Roy0/FdsYzTCWH0ATGHULD5yMCg4O/jzXddpSSMW8DJEBcH1mnz3wZzuMEW3vjknmzCaFo3w2bx1HXW6WWLt3GS3WTvQepp20VAlA1t6awCpWTuThluJ1YOADF0+mEvjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726846520; c=relaxed/simple;
	bh=29J06FnENKSRhNiEzsaOawnMU8S1XN6nGjpRf+49cD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rqtV5mdm9eYaBu6lSjmQiFzJIedwi07EOg2MMehpzmzXjuEL/hQ6QFwig9eGJV7CO8EzWmbgFfvBjR+GOF81RfbCDmfphnViZmUufNvSyIuRevDmi+rJp2MbuCHM/1Q0wec5qdPlVFCQc8P9ueHPtEXc1qyb4WICZSZ1hQEManY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=N6zMYrm7; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="N6zMYrm7"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c8cef906so1577824f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Sep 2024 08:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726846517; x=1727451317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bbk8RS4D7GTQ6O1mhGJvRN0DDSg3VpGUnFRpab1Lu+M=;
        b=N6zMYrm7XcnX37jJKxSmIV1iarDhHZENXqonkC3Ba00SKIg/zM+pdx4jdP3N3eT6v8
         8lof/VsSymR2kbqIa2Js14v80K16YU+CvpBPQjE9u+8YMGMoMtYKb0u74ua3ioEzdXef
         A34hK1wiBHFP6dvoOE3HQmPnNAHpcmO4IF0oHLvdLrFj3TDxCgW0vEGYI4RaNVV6ieWL
         YoUU33biWDB9zmuoyB5FLNWatXjBlzzJc8YBPHVONQOjzJ59+JwyjjcavSUtPpXXF1jO
         iU7niWeLcueNtzlwFOXiyYJnFnycVT8t3g5TYOb5Twr1qDDfJBEi2wCuK1vgGsNmW1Ch
         qUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726846517; x=1727451317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bbk8RS4D7GTQ6O1mhGJvRN0DDSg3VpGUnFRpab1Lu+M=;
        b=p/l4tdYkriYRGI88oV27KfD9MMN6vP3O9GiAQOVuOjzNYWc5AOWumSQ3qhl1ansKqb
         5HxKFSDyge+hTbmcxFyyDfvoe8qI6ZqUi/AOtwN+1LO/OTBKlQaq5TgP/41MzhZqHz9D
         7LlG0J34+k/XeYxBNVS/VX2PmLPv/qndlMBLQDhl7iLsl790lQnTMoGp7q6ujPBzPAHy
         vIut12bucuZU1lOZtainjcPDH1W9vgD1Nfk9R8j+fRw+10tSFn4FK8c+pkBYlKjUEW7U
         SUiBTn37yVNxpHSgv9cRi8ekrOhAdG+iUvaFu2hIHvhjHEIzHEfUHqG82LgkNrfVWphn
         oGFA==
X-Forwarded-Encrypted: i=1; AJvYcCVbmvPwpnwgFQgTXGqXM1x+v8cV8GOys0t3WRxezTZpsTj3tp9Q5k32Gl3BZg31eVvYvIPQlhw5mxNlclGG@lists.linux.dev
X-Gm-Message-State: AOJu0YwR9YTSBy7ynDXMaa5Q3pg97iqIaLoP9izhiG2jKd8W3jGW3TRf
	U9cb33W0kW2ADQHuRtzutJFDxHVV0qma+cKMZE4mIhQMWc2QvTosO4IeVfB5UXA=
X-Google-Smtp-Source: AGHT+IHyLuwMSx6W+yszfdL68bXFA9lI3CmMPHR5iPsgGCfUpF/p+QS+bhSctVxW0rqFbxBI3s2kNg==
X-Received: by 2002:adf:e84b:0:b0:374:cd36:8533 with SMTP id ffacd0b85a97d-37a43197db1mr1920965f8f.54.1726846517173;
        Fri, 20 Sep 2024 08:35:17 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7540e464sm53095045e9.4.2024.09.20.08.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:35:16 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: olpc_dcon: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Fri, 20 Sep 2024 17:34:34 +0200
Message-ID: <20240920153430.503212-16-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=29J06FnENKSRhNiEzsaOawnMU8S1XN6nGjpRf+49cD8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm7ZYWHQjuTz3izuQvurR1icR6utinao6kVDX0G C7QDlvH6X2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZu2WFgAKCRCPgPtYfRL+ TtWgB/9ADmkeRVIKLJuhjWQdhIcZ/A3D2gLQRHy2aMaoVUTcryQy13Dl7IzSjSHiaRhiKO/KgOg K3714yXK57IH5Z4et9dw591yIrmTguSGXdeGPMlPw9A+CbEtvF8vleaBzFU+BgXF53rI6pYt/n9 2Kqbyt/dD4/l35KbMHSf5w7q0V8X2XMDLeWmt/WwqT8rgUywgF1Ql+jEOINYCV0uUtd2hUnhGfm q6GHTx1HPeWhID62H+BqIdY0DP7tIT2Ap3aBOR/ZiZzjKw/HxeQQy9pV0vH5pXmkC/CMCpliwJi n9nRumUKiLbIhbIhSLBkyXw2hf6evC2xhjq0HQsDryXCgTC5
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/staging/olpc_dcon/olpc_dcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/olpc_dcon/olpc_dcon.c b/drivers/staging/olpc_dcon/olpc_dcon.c
index 4cb904a5f8f4..75809f9fa108 100644
--- a/drivers/staging/olpc_dcon/olpc_dcon.c
+++ b/drivers/staging/olpc_dcon/olpc_dcon.c
@@ -767,7 +767,7 @@ static const struct dev_pm_ops dcon_pm_ops = {
 };
 
 static const struct i2c_device_id dcon_idtable[] = {
-	{ "olpc_dcon",  0 },
+	{ "olpc_dcon" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, dcon_idtable);

base-commit: 62f92d634458a1e308bb699986b9147a6d670457
-- 
2.45.2

