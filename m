Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC503209696
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969684; cv=none; b=VIToHfH2J+8QGtm2hb8nCLdNnlf9Kmb7Zju1ErUDbZJgxGnFGCkvq9V4WLOQc7ZGeZTH9xNxD/+DcqtyF239j3fE4ugJBfDV/8JGqIQF0LTF2+oxRs3l/6aZmxI3NbJepn7n4nGqBN0Dq+d345K9nO8of5iHrYWoVLcf37qKtkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969684; c=relaxed/simple;
	bh=5C6U+RztPDFt82u2B4zH+4eGwNPp3uGP6xG8Y9gZWv0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QHBZbOOHXuDlzNdINmD7wishRV8j7eYocb63tdJ+UgJEt+lQyYojfDNdfb/p8mVy55rphNuEp9Nm7ndZTcwwroIBXT3TY7YgYx2/5ecJLXSXqfhqMhTm1iF6SwngD2UsW7O9Udt7JBCWw0jX28tADy9dA0czZCVlI8oWI9wtr8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpjjLsEf; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpjjLsEf"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so20749106d6.3
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744969682; x=1745574482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=swkuPDeDTp/AUquO1zBRQo9AsK4c6bS1Ez65fGcDod0=;
        b=QpjjLsEfII+44zVWmjMqN/Wr8P/xVzETkrmi0ruonpj2XP2Nl1dF+wZMtVy0PbCukF
         /Zij9CMg3icmkdpFXLKNpU5t+dXmf4XcCEMGariJ0D/gwAhIhg1DkTjqRHgR6hi6yB9O
         LgjyQGMy7hXmRu0WU8bX86CmgcMUkzbSYEiqhfp5xe9q+rUImTDFLoHcr9Wm71biC9oX
         PdkcjuCUZqop13kFPIdPCd+hr7wdoRydr5gEvKH8ZeZvGoiFvSNGa14HfJ681iXgJ/T2
         flG+hOJQh2ZfbhLlqie/U2T3keOX237Gf5JrW8W/+cl2YjgDffwGhPrnf13IUWGzPOgP
         EEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969682; x=1745574482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swkuPDeDTp/AUquO1zBRQo9AsK4c6bS1Ez65fGcDod0=;
        b=pHFCEFon/LK8Ua5FoBCKnAIvWXDc0uOL7nSVTPkF+QAGTxJFE0XHG2Bf9o7MnillxO
         g+a4nEcw7UZntHdQisZzZvm1eDcBmjcTdvqJMgAIVg2h/cO1SaoyoyRPQpzCekAi8NTE
         DMW691LaP8PajYxfqk+xpd07o1EMxWWLG+zR80SGF5phPlsV/NhmyxD+dfbIvA4WolUX
         JbAT6esNdH9GGiyjuCkGpHLPq5+f6I+GpM9b1AiUnXff/93hJXRUhJjkdpS0LNZ8oR5Q
         VlMZRIRnYUj8uT79ua1taXSie3Mp/8j8rQFN4SdhKHLpoFEeuuscrsmTUPuXLsl1mnV2
         TpOw==
X-Gm-Message-State: AOJu0YyLvxNDYWIvFhn5A5cGwr45WwyOI0o1db8AMT+SOF2bTSpDd2Y3
	FcYG0NGgmSLIxrwxRvOx2najKOpxPdb1QF7XjNPlOtuVWnd4himo
X-Gm-Gg: ASbGncsuJ4cJLVo03RwcdyBSvwdXyrlwaMS36XDXPPgf2gPh1OmSMsjImhQ+G0FieAi
	4ayHhIJh+jZKh0AIDdvT7KmRQqmDWERRJ5IKDIO+14GqO3oSTK9Gmt7aVKy5fBm37GYfWSLyTWI
	OqxUEMv8v4XoxLxF+zOAAJhFBzOX/DKj09o93KUeavAY4QvrBDnA3LG4jd6gme+De8rSiPsqxu+
	p5ScbRRoU74uMdPUwyRQ01jrDgJckcfBloVRv75o9GIicp44Hlz//WptnfuAUkyVE0yZyJkxP0H
	ApHqi4iEE2skortT2UevyGzaCUjsr9Du
X-Google-Smtp-Source: AGHT+IHh4v9vR4HTkV+erKOLAWBX2lYlyK5ifIWO6l/UrrkhGpbwgh7Z0sYqkw+HngcmJDSS1B7b0Q==
X-Received: by 2002:ad4:5f8e:0:b0:6e8:fa38:46aa with SMTP id 6a1803df08f44-6f2c46527b9mr36143106d6.33.1744969681622;
        Fri, 18 Apr 2025 02:48:01 -0700 (PDT)
Received: from ubuntu ([105.112.229.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c21cccsm8808806d6.106.2025.04.18.02.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:48:01 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: julia.lawall@inria.fr,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v11 0/2] staging: rtl8723bs: Improve readability and clarity of sequence number wrapping
Date: Fri, 18 Apr 2025 09:47:53 +0000
Message-Id: <cover.1744966511.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset adds spaces around binary operators, breaks long lines to enhance readability
and provides clarity on sequence number wrapping by using a modulo operation % 4096u, in
place of the bitwise AND(&) operation & 0xfff.
The patches are required to be applied in sequence.

Changes in v10:
- Sent v11 to mailing list after v10 was deleted due to versioning mistake.

Changes in v9:
* PATCH 1:
	- Added more converted cases found in the driver to the patch.
- The Coccinelle semantic patch used to find additional cases in the driver is:

@@
expression e;

@@
* e & 0xfff

- The bloat-o-meter tool was used to ensure the sizes of the binary
files before and after the change were the same.

- $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
  $ ./scripts/bloat-o-meter rtw_xmit_before.o rtw_xmit_after.o

This showed identical 'Before' and 'After' size values with a 'chg' of +0.00%.
Changes in v8:
* PATCH 1:
	- Added Reviewed-by tag to commit message.
* PATCH 2:
	- Added Reviewed-by tag to commit message.
Changes in v7:
* PATCH 1:
	- Added blank line to enhance readability
* PATCH 2:
	- Changed `power of 2` to `power-of-2` in commit message.
Changes in v6:
	- Modified cover letter BLURB to reference newly added line breaks.
* PATCH 1:
	- Added line breaks to long lines to improve readability.
	- Changed commit message to include the information about the broken
	  lines added to the patch.
	- Changed subject line title to also include the newly added line breaks.
* PATCH 2:
	- Changed instances of `& 0xfff` to `% 4096u` which were now in the broken lines
	  after the broken lines have been done in PATCH 1.
Changes in v5:
	- Converted the patch with the subject "Use % 4096 instead of & 0xfff"
	  patch to a patchset.
	- Added a patch to add spaces around binary operator.
Changes in v4:
	- Corrected patch to use '%' instead of '&'.
	- To ensure this change does not affect the functional
	behaviour, I compared the generated object files before and
	after the change using the `cmp` which compares the two
	object files byte by byte as shown below:

	$ make drivers/staging/rtl8723bs/core/rtw_xmit.o
	$ cmp rtw_xmit_before.o rtw_xmit_after.o

	No differences were found in the output, confirming that the
	change does not alter the compiled output.
Changes in v3:
	- Added more description to the commit message.
	- Removed blank line in the tag block.
	- Added more patch recipients.
Changes in v2:
	- Changed the commit message t a more descriptive message which
	makes it clear why the patch does the change.
	- changed the subject title to include `4096u` to show that an
	unsigned module is used.
Changes in v1:
	- Added more patch recipients.

Abraham Samuel Adekunle (2):
  staging: rtl8723bs: Add spaces and line breaks to improve readability
  staging: rtl8723bs: Use % 4096 instead of & 0xfff

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 6 +++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 9 ++++++---
 3 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.34.1

