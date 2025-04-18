Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC60B1DA21
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744968681; cv=none; b=dmHyXuI5238121UPrHwQ76909Wm5sP3zt+S2h3rxI1gojLtrWCLJoQZdDnx2ggelunY5ktUmPB2sw5Dz1bSifPHYBWu0EulRF164HCuGenYMX8MG24dAOkmGq3d1Uelfv1yq/lvOH6NZ+wg5rX9W5BDTrXgtOkWF2g44e0c8rPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744968681; c=relaxed/simple;
	bh=35eYlthOzoCoyxaXhYS51LoC89mrgWwmbNDsYzxwC8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MlDn1WkzsoDZqZpsyC5DC4fYNUIMttLvlu/TiD+g8WtWvjD5l5lM9LiqyB2ui7a2IEh1d9n4iCMnU+uSQUJ6ZzJQy3Y8U6+VtxOqkukrauepDQB3mrR3lb7D9mSjfPw8UK8Fwj4XCoFc/Gp809VbjlvqOrKX5vPV9Od0pmBmW2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFOUjrRw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFOUjrRw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so12996755e9.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744968678; x=1745573478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kmVZRcl7cqHTS3SFq/dUhCtlv0ePManje3rm68OnUn4=;
        b=HFOUjrRwNijkUcpc04oh+QsZ5RsZJDoAJd/y4RmRMlaq1KaeFHwDxIrXttB04SVzyr
         PKHNFIL/t1qOISM1iV0ydcdwrer7KYgpcQtUdWAKALibHAyeVMUfhhXNbGuetAY6qWBr
         R5RRlRrBm7Z3yMpR25fb2JqwMHL/3eLMowjO1GgVzP7b3anLQtq1g0y6o5ju+H3SQrmm
         AVKL0oSSlyvjvp4AmYOB0ySqKDYwl9Uj1Psfp4QfJZ9yFEKxSnZ9Oo51r5fJ/U5FFddl
         doYapme3FN/IPw38x8Kov/xgpOfIb/MCGNJmvOKGgl5gh2hR3Y0cD8K/XqoneSq/UEbj
         t3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744968678; x=1745573478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmVZRcl7cqHTS3SFq/dUhCtlv0ePManje3rm68OnUn4=;
        b=n3dPK/hOq0nbYc4ceDndklUYQR3diHC9TZHogqO6MWMffLde23E39N6pbIS3VRw30p
         iFESRk9C7WlSGSB+gTH8dtqL2pvPDG0Rlwcs+t+b2T6qP6kVdv777sbFoL9U4vmvlgmk
         r8l6QzT7FXmBS1wc30kgCPhkP66FqMfEr0rTAueejnkv8jg7WZYlSeIHraGV1p3cipLF
         aAK3hNuXe6LVd2Rx4j8c8zzAV8FR5YsmTHqRIoBfYxhovvXbmIjV+2OK8znX+vSvaHYa
         93nmkesU1Seoxh2WKQb8tfE6td646yL6IaABTFeUEkqMUyw/M0q+AAhy3AqzPmzCMsOC
         6JDA==
X-Forwarded-Encrypted: i=1; AJvYcCUS54JYimCrsZZA0gX0ckWcdn4ic/bUH7stbQ8Cop90a4TExVLkJD3sC/yc+671ybK/Q3Jp3mtwH+yyAHP0@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkl9VD7QuLz1HVeEBlHeLj2OmpBMS/pudRjSgMA5ka9stL8oiY
	iyW8ED+rzqZ+xaQfDB/N0qGoF3/VhO2ISJh9fbfRblN7Aj4lFNeD
X-Gm-Gg: ASbGncvq6Yu/xNelXWygTXhQy2leJveXYiEo4YdMEgrNxGxMuAJ4iXY935qKqkjzd/v
	8mP3lKvLwUpTLFBeGsWGUcLRXE2oFO2lXI5qEpwAsPrvpsHO03kXQfxmpQ1WbrjbHNOetg2A04m
	CwEgTCX3AjdhAc405NR8S7RBbV7TkmRsABHQiE8wD2pfoeYI19sJBK8V0M0H/Rgt+PnOFNSVoH6
	1LloJ7dESDV1elfSLfwGmXDLfihUQmebJbZ9wqkf/QmSD1UC5ufNcF2j3BiSJkRwavCwnXz+xdU
	yZ/zkQZW4JboCeykAwZUbPfCX8WL9DA8QF7MSbGJj1YvS7PmhuiIYgh8KbVyfHU9Vij4Gj9viKA
	sW8zdB+FVZFo=
X-Google-Smtp-Source: AGHT+IEupr4/5H3YDxZSchyvSu0/QZXfQmk2lwlWupU6OWG5QAf7RG/eaPpiQUHJ7Q5pZFey+p4Ddg==
X-Received: by 2002:a05:600c:1e18:b0:43b:cb12:ba6d with SMTP id 5b1f17b1804b1-4406ab7ab1emr20798095e9.3.1744968677732;
        Fri, 18 Apr 2025 02:31:17 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9df6sm15599595e9.1.2025.04.18.02.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:31:17 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/2] staging: gpib: Clean and rename common include
Date: Fri, 18 Apr 2025 11:31:09 +0200
Message-ID: <20250418093111.8820-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches prepare for the release of the userspace libraries and
tools to be compatible with both the in-tree drivers and out-of-tree
drivers.

   Patch 1 removes unused enums
   Patch 2 renames gpib_user.h to gpib.h

Dave Penkler (2):
  Remove unused enums from common include file
  Rename common include file

 drivers/staging/gpib/include/gpibP.h          |  2 +-
 drivers/staging/gpib/include/gpib_types.h     |  2 +-
 .../staging/gpib/uapi/{gpib_user.h => gpib.h} | 42 -------------------
 3 files changed, 2 insertions(+), 44 deletions(-)
 rename drivers/staging/gpib/uapi/{gpib_user.h => gpib.h} (82%)

-- 
2.49.0

