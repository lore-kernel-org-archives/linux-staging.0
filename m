Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B3921340
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382461; cv=none; b=Rxq5qdABnjeR1BBApIHg3l9iXQkXOD5LnHTdpDGxYpdMBV9Vyg20SpOGDF6n3JSflTWLjmlR93ss2IxgsDBxaTzKORWmuwYvTaoe3tTPELH29Ap0lFnBKVDvpNMGQ2vpNI7jcDxj6vAE5Kq8duEkulAiBvXbevzWVBJ3ELaKy9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382461; c=relaxed/simple;
	bh=j2O6drT/yEaimEwcfCew5PpZKxEWLADmXSUd7fDuNnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsgJFsR2IJOn2Dsd6L0hsGBtXFc4CMsuSD9SN1pvKcYvUcBAHnvQKV9Oto1DrnpYEq47NFW3F2cFHysHC0CGnixvgfPaZbLZHoDPBwxCPxFPKlgW+oUjBo/D2+eafOdGqjf+8x2CAF1/inoSc3CnrpGRi0O/gvbTH+GqPUA76+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPjxUWq2; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPjxUWq2"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d13b83511so412662666b.2
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382458; x=1726987258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWDI5048snuoXs6IvpY8OD2FxJJ3IZXVvUC8J5ar7tY=;
        b=HPjxUWq2ansQgrxapZULScA6VhM6mhVuu+1wDUWc9zY+0HWn8ho8JMlJz0Mqc1978R
         dA9dh3JCdpWRfCcANgOpAMWL+eq3D+nF2Vyc8mNBRCn4ef1M2dT80+dYQ8/mQw7Nq4c7
         bCsiv+stJfWCS2HrCy3cFXacwstwylKXqOZ1LsV1SS6gxkD+2UZxLOS64LDQYT3OuRiZ
         vlGLooQv0ihSDMhmGjNAupSRNyGgt+grISUjYI7rNGnOdhVtf/k5DBNtD6WwOEHwKa1d
         DT5reh6/AwmIOWFe/mS+omfthd1qqYTZOe+LLadnq1FKCzycqQO6qbVyi7zFCYijkwe/
         bfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382458; x=1726987258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWDI5048snuoXs6IvpY8OD2FxJJ3IZXVvUC8J5ar7tY=;
        b=fgm17uz5pEc+meBbhGZIm6INxagSM7HihrBx2olo+ZPZsmjEbKjf6k+1YCUmPrKwMw
         dawUgShvYMiovR4W0K9kv8T0acD4jKKDftU8NNqTWXPmXIOxu7HAsfC0/MUAdd6Byxix
         BHyzPgLDZMLpX0L3xeNo0gy2SAq2lvEuAWUPASDIpHIaDottLaee/4S1TLZcfhwPN/+G
         18eMu0OQVrZNcyug52Yevo7XIV4gRsIuzkTW0ePm9MKXawvUZ9pMXz1xbrkGX4+sUZNr
         H33TDD7cn2SaQFcBpyCBzGb8jrTu2qk8lxwEjeuLoWJbVGnLPfplFhVy4jAYF7vgApuj
         +HAA==
X-Forwarded-Encrypted: i=1; AJvYcCXskYW9ECM9jxxX3yVOSeYCLB+bhMLUaclp/EO7hjrtJ8ARoasJF3wRJXSMqzXHd9lQdOwisN3MTOECKAqp@lists.linux.dev
X-Gm-Message-State: AOJu0YwU3srD0/irEThwk7Gnh1gewov6zjWRjznVt7BUjK71PRP2hWUS
	29nh6yzTn2UKcwqbFFQYN0IciYg6sJGzYzB7YZh01ioWoM48+v+vA0riCg==
X-Google-Smtp-Source: AGHT+IEt7MPkHW+ZL5OLRwFItxC7DdTzX7eqPc/VeXHarcujLoUO+0sL0ZjcE08o/LTo3wnGzQmseQ==
X-Received: by 2002:a17:907:f18c:b0:a8d:3998:2de with SMTP id a640c23a62f3a-a90293fbcb8mr1072337466b.12.1726382457958;
        Sat, 14 Sep 2024 23:40:57 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:40:57 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 01/17] staging: rtl8723bs: Remove unused function dvobj_get_port0_adapter
Date: Sun, 15 Sep 2024 08:38:15 +0200
Message-ID: <11091c00a57600a79a623f92ca8435034f0dfb3c.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function dvobj_get_port0_adapter.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 8 --------
 drivers/staging/rtl8723bs/include/drv_types.h  | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index f37fec1efaf9..2fb14f4ff1af 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1840,11 +1840,3 @@ u8 rtw_search_max_mac_id(struct adapter *padapter)
 
 	return max_mac_id;
 }
-
-struct adapter *dvobj_get_port0_adapter(struct dvobj_priv *dvobj)
-{
-	if (get_iface_type(dvobj->padapters[i]) != IFACE_PORT0)
-		return NULL;
-
-	return dvobj->padapters;
-}
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 0b35c97843cc..0094eed6c32d 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -320,8 +320,6 @@ static inline struct device *dvobj_to_dev(struct dvobj_priv *dvobj)
 	return &dvobj->intf_data.func->dev;
 }
 
-struct adapter *dvobj_get_port0_adapter(struct dvobj_priv *dvobj);
-
 enum {
 	IFACE_PORT0, /* mapping to port0 for C/D series chips */
 	IFACE_PORT1, /* mapping to port1 for C/D series chip */
-- 
2.43.0

