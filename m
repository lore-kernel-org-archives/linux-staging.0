Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDC8443035
	for <linux-staging@lists.linux.dev>; Thu,  8 Jan 2026 10:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867069; cv=none; b=FzK4O44mNEB1ddlTXMsvrC9uSsKs4X6J4Sf+TYRF2dSWTrh69pL+hNr1zOnALKgrVDTQ59MYfb392IrG1xbh0HT0CGkmsfgfa4Av9JqmuVwiYjtDuhMZ1sI9LAWcNWO4412T7RISmM/LSrpvtSGNhQlXAu9eP+iBp8TW2oGl048=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867069; c=relaxed/simple;
	bh=h9uwAqvKFjHNqaoUbE4IiDPfzSZFqv76YqNJ94qfNIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q1Z3yCV7LJzwVzk70L7b4YpwAoefSdRSeVQ6OnjdftebPgFbb0LU1ZCzVu3G5IPuU1RgLtflQ3iTSYvqEqLwoQGHI5x/tVpGh98sMP/GHJszajM0KKhB+PjeP69bC8iR/iAdjjzqgp4b1zo2pBjXZ5DbsP6GqdvMum8E3bHz/Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/HQEWK7; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/HQEWK7"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so1966251b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 08 Jan 2026 02:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767867063; x=1768471863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9uwAqvKFjHNqaoUbE4IiDPfzSZFqv76YqNJ94qfNIw=;
        b=j/HQEWK7ZObb4UOcMUBE8qVlX0f0GNum9wyHt02+q6pdt3AQaBZl3yEfco/I7TUbm4
         mnVd5vuXKq42dx/wj4lxzCTm5Bqtj9HMl7jljxQFjPiMbwbsyl9iWZV9PwKK05kyeO2U
         /pVDCD5HFYZb+X/fYLgZHC5weOP5kTEniR+zi42QDMVInhC279d9N6SV4T3epeq1mLMO
         Z9gdpGjvdYUKIVUAJIAXD57HxM0XHpguxyzaKTl0Jznt1hUlVzYmxuU/OtYTVNWV981Y
         8HypyhKSV8DZQla3UnpS8qTxQo8ghu42GUzCJzdPRskvVblX6WC1gW8a+BX0jLbYyCRi
         TqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767867063; x=1768471863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h9uwAqvKFjHNqaoUbE4IiDPfzSZFqv76YqNJ94qfNIw=;
        b=RASEjCm/HiACo9RCs2nQOBC/bIVPbCFrs2mTDdzIIJgPAh8v8F6VPlLnUUAiSZBXYI
         8jjnxlCfKmaMUn7tYHpryKnUB+5SyX4m+k8z45zZR8kWgQdA1Zk6uP7PxI9+jEZM2TBD
         nhkZeCRmRntMK1ilCzxAASeVf+S9XI3yNxxGH/k7n4MZurBQGXLiNTPsZpEFtD5zglqd
         +PxNwWtVMFGrn8LFwtkhAnZrFrWTeq67rclqn5RFPTl5OjBXZBLcqWfpaQgNJavJj9dY
         mMYm9/0W1iXl2BMCOyh0wFYtbXmYqHs18nDiidlgwh9fX6ZkfKvy5fCfd7oxb4Lr7/aO
         maZA==
X-Forwarded-Encrypted: i=1; AJvYcCW8GMMLwO7E/6JNTmYODQt9dI06Lr1Dl8brAPqLP5LJw//CAwCu4SwN/q07B70BfFfswcArpZJgb7l0taXp@lists.linux.dev
X-Gm-Message-State: AOJu0Yzgmw0FtHXbfGXKclpsVxZ7048g6PZULL5EFceCK1g75Q77Bw7q
	jEHFWMGCG//Chp+7fesSjloOvXiLzMflZX7zSJIcnh/CXMbhgA08QLu2
X-Gm-Gg: AY/fxX6gNZBJVcAqHtdVlKmvKnCunAl1C5vzMKmFlfz6hZL8UbjfcrWYg/97dUYHAVY
	hMmro5UBdDhnepjAL0uH+5Muh3GHT7vstga9S490TTw3JF2Ssu4wr7KPi+BcLe6MhrZ8zhJt7c3
	JyQvkewa97wVSaalNPtfj2JP4JUMSZwzOUAkvJkUWTGC21oOFoyG0Q577AMJZfLxLsPEx37D15C
	6c6aG9O0K3lch55IqachEwk1XtQMASacv0+U8dkWR/XWtgxxBtcYnEOKEUxmDEgKxfYDl0f8sRN
	ViuSKYJZe2XOmLTyXnasKhxw8uAmQhLmcJzC7seEM1Wtk6x1CHYuMIxXatWsKTfV42g4roRg3rh
	n0h2IhbVcnKW6tEub/Ct6qjoVJ3zApS116+cntBLSsZsomalFADhXzPxzaHjM9AhCnwfeZUCAiV
	AwhCnDGCPr5CmGBUFml2Z0oZcjpi2WS5PwVJbru1AM9O6QiHNCLDBOswXZ52U=
X-Google-Smtp-Source: AGHT+IEHYRvD7hq42mCwI2aLKv7F5lVXS2SHsFyfxpXbBk1ir1DO9ZQE/5l1NoYaYnM2SJIL+BGJXQ==
X-Received: by 2002:a05:6a00:8d8e:b0:7b9:ef46:ec61 with SMTP id d2e1a72fcca58-81b7f108957mr5322486b3a.26.1767867063293;
        Thu, 08 Jan 2026 02:11:03 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa19242sm7318484b3a.7.2026.01.08.02.11.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 02:11:02 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: align tinylcd write_reg args
Date: Thu,  8 Jan 2026 15:40:57 +0530
Message-ID: <20260108101057.9340-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108094709.92561-1-chaitanyamishra.ai@gmail.com>
References: <20260108094709.92561-1-chaitanyamishra.ai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks Greg,

Agreed. This change does not improve readability, and checkpatch is only a guide.
I will drop this patch.

Regards,
Chaitanya
