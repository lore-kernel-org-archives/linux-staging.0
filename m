Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F4425291E
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 23:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154741; cv=none; b=dO/9YM3wslPkoFXZhOI5i66GvFvxiWa9ble+p/U3NdldypGouoVPMH47jpCIddnIE/nKD63QueKNN3UDdhoAcFfpC54cFt30D28fV45dx6z3za9NOkyTuyTxeXwjD9CGSr6zHIZUssnYajy4MQMkUmitZuUJuAjwdzBWGo3/CLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154741; c=relaxed/simple;
	bh=yaG+cNw3thGzK/uMl7ZE2Fba3N0gTNuNWI1pEKzcOXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EZN+HdIT/ITeeShK3CBPWdiuC2gV8yNfC7+a3oSLz4FlBsytBdweXHvrhJZLltz5dV5uhKoNamg7K7VEiLm6rCt6PiZI2EnhChF1oXZTkw3J/FNgJzcpZPLQ9Q14tJalROSbO5iiNrmLioD350/VZWKzducRrNxhoSC+lq3DkgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=JQSjRv2X; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="JQSjRv2X"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so3460532a91.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 16:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154739; x=1744759539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QdaIenzsmWJTTujQ9Rnj1L0tl/QFO/K85i0DJLh7p2M=;
        b=JQSjRv2XSt/qXifXrdKq8g3Apafav4Pb+7jqsVv+lKKlkLT9h8lzRzvUN75QAc7Fd7
         J7PWa9qdFAQD4N6yiQkTiXS4isYzr/kllgV7fGVolfsxKn2UKVSt1knBDZVqJ4VZ5WGp
         iHLMHcX3HK00N0uOROcqV3kbjppOdJI7Vfu36V4Gmfxj4gWRHU+8k1AYRFjc2LBR0bQZ
         7UJzI9KJ03AZCivaNup+3PO/VJV9a7fDu8k67lvadraS3mL2ZMJNWCoROYxhBgvh4J2F
         Zvy5RDY3vUMa4x2m1G6MvGzBUIEq9E5Ko0UhGM02Q2f4T20olefu6+q7teNuj3n6iwlv
         SWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154739; x=1744759539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdaIenzsmWJTTujQ9Rnj1L0tl/QFO/K85i0DJLh7p2M=;
        b=nOiawyKFEKqL5jI20w4MftC5KB8V+Q+/v+QuPFrmPO+YaxmXMPvQ8NwjS28L0s25a2
         eTnaMNn+hHkwWd0JBToWeKFRdFI/5gniSCIWPWJVeCJUTxQhB5UBsor03qLn8e0Zomlp
         HUzXdAXsVWN1yFQDao9JLgGQeqboHb8iNU7Oxwxjr/GroE0hs6QX1Om/k7EfBSjxCeyO
         Owwmzs6g0m3+S2F3u9TBo9kd8wwVdTs6Hpgm+QbrMG3w0h5WHD3hmJgk/gmm50r07Yrc
         McTG4Vox6kwj5MbNVYJfpVRIvMqGJXLKwpWnxJy+vKJxoMm0GUOlTGYcW/Q7lULacLYj
         lAfA==
X-Gm-Message-State: AOJu0YxCi5k7wIMYtwHrGuhjLy8XdfFRCwt3MPiAm1+wTrX5CkHC52MV
	trF3pPZ1FU8+DBIQgCFf3+vKD348J0vjKmBRO03dxfA1mork55eeDPLiXBSP5A==
X-Gm-Gg: ASbGncvIKzFYrGrRVBE8mGpwlLd48QdlXJ3XOz75u5YhBAEdeKLZBwHHbGyFfpvYxIB
	1tsN3wnrbOv2mrLPMXZn+xk3c5PDlD+XrEFGWFsA3zhnlndN3PMq5pzrZHsaPwZlTkaEC2dh/+J
	2KNOycxySjmRTDWRU2tSTzsE9976f48a+0bYChyboGp3/kajtQjxY3PuIFnWfqRBqig7MW7sk2N
	eEbK3wd38wXsJlBjjXgz6EwmgzgEZVblLACYQDEX8Ic0Crx9nnLKqNUTpezYhu4OMy9njU9iOfw
	9zQ4DeHTldAm/Le7kf9uiQ3hstqzOpfwm4ob6dLnCF/F2mxJ/BnbPT8n0oC5rl2Xf6BpL8o0jjr
	3vaKLgbJ+1SQvoh/DKv+J
X-Google-Smtp-Source: AGHT+IHdNvvZeYZEkWu5hl2Ax+3ZQOzgnn/I6tXchKkRcxPGcuGKRXDFSRdslYshlPTmMcdFAUw0pg==
X-Received: by 2002:a17:90b:2f0b:b0:2ee:db1a:2e3c with SMTP id 98e67ed59e1d1-306dd31f6bamr403489a91.1.1744154738672;
        Tue, 08 Apr 2025 16:25:38 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd187263sm142158a91.42.2025.04.08.16.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:38 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 0/7] staging: gpib: Removing typedefs
Date: Tue,  8 Apr 2025 23:25:28 +0000
Message-ID: <20250408232535.187528-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing various typedefs to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

* Patch 1: Removing gpib_event_queue_t for struct gpib_event_queue

* Patch 2: Removing gpib_interface_list_t for struct gpib_interface_list

* Patch 3: Removing gpib_event_t for struct gpib_event

* Patch 4: Removing gpib_status_queue_t for struct gpib_status_queue

* Patch 5: Removing status_byte_t for struct gpib_status_bye

* Patch 6: Removing gpib_descriptor_t for struct gpib_descriptor

* Patch 7: Removing gpib_file_private_t for struct gpib_file_private

Michael Rubin (7):
  staging: gpib: Removing typedef gpib_event_queue
  staging: gpib: Removing gpib_interface_list_t
  staging: gpib: Removing gpib_event_t typedef
  staging: gpib: Removing typedef gpib_status_queue
  staging: gpib: Removing typedef of status_byte
  staging: gpib: Removing typedef gpib_descriptor_t
  staging: gpib: Remove typedef gpib_file_private_t

 drivers/staging/gpib/common/gpib_os.c     | 155 +++++++++++-----------
 drivers/staging/gpib/common/iblib.c       |  12 +-
 drivers/staging/gpib/common/ibsys.h       |  11 +-
 drivers/staging/gpib/include/gpibP.h      |   4 +-
 drivers/staging/gpib/include/gpib_proto.h |   8 +-
 drivers/staging/gpib/include/gpib_types.h |  38 +++---
 6 files changed, 116 insertions(+), 112 deletions(-)

-- 
2.43.0

