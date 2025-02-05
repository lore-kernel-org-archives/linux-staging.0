Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E551C1FDA9B
	for <linux-staging@lists.linux.dev>; Wed,  5 Feb 2025 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738780264; cv=none; b=D606IKrV0q5Zqs/VBpbqCPEenXeLrf5copAZhW1Jg3gLHHpIGYivn8sB6CtB1mhSBsey5+veC8a5Hwz1sCaAYKTZ/PaY50fxTnD02xFfaBSjZykKN/+TqYK8lI8DH+wERoWUUASyaJ9DMUc2A9kJgdKStIEW5DDZk6afXZNpBV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738780264; c=relaxed/simple;
	bh=AgAXFdLVVEihfeM8ysZZmEU+gEAxaTs8AYeDW7rK1OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cb2FEPncnTQgCfvqTUKTI5CCKvWk15u+NZBPNjoWhE0Jpz/jRYaYd25Ww1v9LZFTYjiXfHqRH+O3i9mzH8/hjbZK0LEWfPLKoydjRz0iJ32qXxsxIV46pEknw1ajw5IdBuD2RFIar2AZ7M12Utx6jXDSs7yhRaGrn+DvWzjs/Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+GJtOgP; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+GJtOgP"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-46fa7678ef3so1216881cf.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Feb 2025 10:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738780262; x=1739385062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRu8lJ2S+gftV8NR6vzgjYQmf6hY04ZpBFo14C7wy6U=;
        b=K+GJtOgPBeY2eeSCe5wToA6zXBdDoUenc7bGhkLaGzRbRV42AUVtGHo34NYGSsiSNk
         WRaT/vcnabWyzxhcMSydm71eGC8N8k/KI1zWwUSh2c6vk88wN5+l1up0jomxqbuRHevh
         y++ob7WOAVHO7idYEn329b13XIZ8Y7Uk965G/4Ff+0P7hgMneC0pLiSOuK+NtKsmA95A
         J9/kqy7c06nA36PS63FzhmuoP8fwK4fWBZYmm6Rodt/lO+DymRIFedL0oQC5ektqpvL9
         /w2SnxaJK2Ab4NR8fX7rDWNaMEVoP1Y2vzDuxV7UURQsOclOePOkE2O5YC8Om4UOtQCk
         HrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738780262; x=1739385062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRu8lJ2S+gftV8NR6vzgjYQmf6hY04ZpBFo14C7wy6U=;
        b=fn3PDDcFdloPIQVnQYQyZUgWcq4kEy0IXll3X6lbd36Y1OQNhqPyFu9X499D5Ioqsn
         ChDa8tqlYPxVK7u/29fjO5kybLoy+Du4kfE2OJ0Hl6o822RI7erw+OgziPNrw2F5BADP
         ohZUpyo6gMJT6ysG6LKL1LmHMOnPTUbxWkLhnF20cn1cqbCSbr5AphCDod1QLwlhNWQJ
         7GkFXuulmKjALumBTqgCJ8QUe00WMgccyx7YsKxOCVfAqzlpsa8/L8KTP8upyG3Lt4f/
         +TS8H9nChQIig4YACSOvzLsoN+yrKuOMauPKMZPEXXcvxb8Ly6PDShwyruU6YCJa7ZmC
         jgag==
X-Gm-Message-State: AOJu0Yzy4u9VtRVmW0/l0weglQigQId3F/QWS+Pu6Oeej2QZA+sufXu0
	DKxWyImkQ1cx7hxkOneOwinG78IxxJ9wVEZs5N8Xq8GbXvypLRUI
X-Gm-Gg: ASbGncuI1RBDDvCPXSYmJK2mPamlbWwoWbFt2SEoIjm+AM+3O4jjISHt3Lz/MxQ8Xrm
	JFElMup6zUF/DZo5lF3QFuFdOTrngWX2Z64J4LWc39HAhWhD5EevhT7c2G7ZDWn9fDw70285YcE
	xnz4FP+V7rNV7latPbzq0HxGErUjzGgHT0P2OyWGIBUXq1EcKS+CMn80niNmg7GKOLNSpRkApC/
	eTL0oyvNO7FmgR05EmEMLRb9QVdvoPDDDFOrNiINF+s+LKzuX4Ju+2dsGNox+meHlcqkOiES74Z
	T1zoHygk155LLOLzzIpwsw==
X-Google-Smtp-Source: AGHT+IHn5QFciUJNlaHMn2u9bwUYf1eujyg9AiM+KsaTgTPiGuqF2MJbbwWul1/abgvi7UoF9jQH7w==
X-Received: by 2002:a05:622a:5186:b0:467:63fb:68d7 with SMTP id d75a77b69052e-47028303855mr70329291cf.50.1738780261741;
        Wed, 05 Feb 2025 10:31:01 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([149.88.18.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46ff3bbe998sm57498451cf.24.2025.02.05.10.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 10:31:01 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: Fix coding style
Date: Wed,  5 Feb 2025 10:30:52 -0800
Message-ID: <cover.1738780135.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the coding style issues. Reported by checkpatch

Ian To (2):
  staging: rtl8723bs: fix spacing complaints
  staging: rtl8723bs: break up lines

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 182 ++++++++++++----------
 1 file changed, 103 insertions(+), 79 deletions(-)

-- 
2.45.3

