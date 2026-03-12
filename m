Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9871E39D6F5
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 18:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773339842; cv=none; b=i9LaeeHza0cVaGd3vGGiXd687vGZ2rnrJlqV3ExAATYViZgmpnuCstRYXh//BUY1y7KLlfHs5rjiolohb0kY8Oll7BisID6KB6+1em6yaU/wgkdpW9/VoH9Q5x4U24pMcaaSs8wibbvJTSyosEclrlDHseOPuDYnvp4+gXJxTfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773339842; c=relaxed/simple;
	bh=cm0CPNsgY1aSv4jsHJ7kgdi2pcX3zwL4berCCM8f72o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7A5306Jlyvk5YR+HJV95Qp6/v5GaAF5fKXSCeLPZsrngq4BgEWRVaNPSN94Yp54h9SLHj2RFZbtzYA0wKS1nZYgTNkbguEKQmvQh1W9xcqzx/lTRS0zRyBQdZH/hsu3AyGMhtrbwK6Bem3qQ2xQ9MHEKwN+lr6N6yNI60slh2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLxWxJWZ; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLxWxJWZ"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-482f454be5bso25726145e9.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 11:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773339838; x=1773944638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNtQZkznOUxB6dxMSHKoW0+/fzU3LZbCEcY1Iu8Y6DM=;
        b=TLxWxJWZBY+n5p2JM6iwTTJGtsmi0GzFaxq+98LgRUW/rTLaoRIC6f2F6a79g/Kmla
         vLoBM+T5Idz5GtzptLop+pC3CvgJQLVD42rxvj+pCVXcHJBjyOyaIwesVz9gx2khsIeF
         t2pjrN5SV2ZV/9tpOHbEVgYF1Np4XEb9qBlgQAFNCpMkAfMw4/RtkqjvNn6EgQkP3hpt
         PxfV7dKudgvN1J5U6WzERCsQfPTTiJDvaKJ22lyYdazO3ntEK0llEwncorxmArE43epV
         lQC48d6tdKYJBDTX/iCdmbCfRY473OSeN282RMEOX1N2RKDTuycRBwlaQCjW+rbCzmbB
         rImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773339838; x=1773944638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TNtQZkznOUxB6dxMSHKoW0+/fzU3LZbCEcY1Iu8Y6DM=;
        b=IIpliZ76jJyGh5/U/OqXShpCiCFVJvxcCbOX/nWorYiIZfQndZKQywhVyLlcowR0gk
         zSuUFO+qERA7HEuA/WrAu8WoaBNFNSb9mx645tIGYxNhNG69lduXIyOxgJDEP6ArvLkG
         L0H4xgXc9noq14we798D5ap195xsqsQtJtCt/U+PqAo7RSfy//Mysny4uNZZ0Gbw5m+x
         6C7o0FDoEiiudoaO4rGMG8iy/KxaBejaGnTEfEGvhl7mvyas4QSF+DMP6pQUyTjEuQ5T
         8BfcArjDhmmOqkFDu4l30H5wiyYx0sJTEBRzOo6wXHzgsTuOPj6m+eGZwh1AoImzIJJD
         r+rw==
X-Forwarded-Encrypted: i=1; AJvYcCUyHJUeSJnMjTN8SL79Ro1hvsocwVBhHhxRLQx/KQXzlfC4CqtG+M0wH7KgWL/Pj2Xxwrch+E+bbpiolAGI@lists.linux.dev
X-Gm-Message-State: AOJu0Ywog92xNFulL7MTe2UYW8CnsKJwuZazJ456G6jA6rw6sRHGd+Nc
	hbALUp+Eat/B+tOtPuR0mKxA8tbObUJEueG3O3BO2nzi8zSlya2YdBwz
X-Gm-Gg: ATEYQzzG55v3lncC3ta+2b2B1hoFG7jLNkP9gmVh8D1h9XetMqPj45GGR978HbV5605
	svQ6tSDtm+9QNQxzsr54v6GZ1UOkus7u8xMLnstOLVZhVuez3ozgE52SpF1nKq96+Jk58lybofK
	VKWc5sFEFeHzDsJUEcbWrhEmlGB9PulD80UQqfClfyzjSKqYWrGE/EMyn4ecvPVU7epmLWzD8sM
	nUFXlG9iyAy+yPElSay5Vf8v9Ol3ITVUPREDJ1PIyDLKLJAbJfembBWzuyg3nEIttob2AlqlErd
	u+xt+bmfnpf8KENWAnaIvOk7/Yu9PduSy9tau+1YdfSBChHad0eEOWN9JfzVSwAncx7SOATXOlw
	mjLvRA9Q+spgcIPFnOuz4x+kgEqRmEn7NRMUB8GRj8+dYKrjul6/ZELsdVmWQdKyVayWcWGmZXD
	aM0ShZhxbJUksqfpmLf08gC4VXxDE98ae9jJCpWhKl
X-Received: by 2002:a05:600c:8b18:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-48555b47c4dmr10714875e9.15.1773339837662;
        Thu, 12 Mar 2026 11:23:57 -0700 (PDT)
Received: from DESKTOP-BTQF5RC.localdomain ([85.110.79.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556404816sm4765335e9.5.2026.03.12.11.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 11:23:57 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: rebootrequired42@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix blank line style in rtw_io.c
Date: Thu, 12 Mar 2026 21:23:39 +0300
Message-ID: <20260312182338.9788-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312173903.19822-1-rebootrequired42@gmail.com>
References: <20260312173903.19822-1-rebootrequired42@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Thu, Mar 12, 2026 at 18:38:59 +0100, Lukas Kraft wrote:
> Fix checkpatch style check for blank line placement after functions
> in rtw_io.c.
> 
> Signed-off-by: Lukas Kraft <rebootrequired42@gmail.com>
> ---

LGTM.

Reviewed-by: Bera Yüzlü <b9788213@gmail.com>

Thanks,
Bera
