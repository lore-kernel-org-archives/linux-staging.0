Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DBA2E92B3
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 18:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770403541; cv=none; b=CHG9M28Y+cFn5204/LEWpef/NFccoqZDS8Dk6Ye0YcKrwwzwEtYpedbHTshgfCoGHbi2rc6BeH/CupjPPkq3uD9S32ttLVMsGD1I9TPKEFor4x91Rh/pSt7RZMrobPuS3GhEjAsYLncTnPSHerlxKfMWFovY2y8dG/0KwaH/UoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770403541; c=relaxed/simple;
	bh=QOGdc6wfNaOI9v9IX5QMoxMm4Vd5Vb1VZWpK0b4QQ+U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kufl3RQdl/2u6TnrgQ8r913xijmStGdlkk7KSwkn4QT5r5tHmEf6yrFWgpdPBJ0UKHWNCNuDVA1XxmK60vmOK7o2l7O5Q5XeXHzDFte6/dLj+RpMWakTBH5rnKzq+u3KQm1CE+fbxHBVFYcHWJtpNj+T83rbB/8hbtFpUDhYXJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wblc4LhL; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wblc4LhL"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79088484065so23192897b3.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Feb 2026 10:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770403540; x=1771008340; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOGdc6wfNaOI9v9IX5QMoxMm4Vd5Vb1VZWpK0b4QQ+U=;
        b=Wblc4LhL+w4lxcfaAfjB8sKhvsykGsqowVya661iVTqgPmrtrvgevfCaPRA6sLopR4
         1al44Gwct8foHcXPsCCDqggZ7id1UMjxr3TxDFWJ5OXNJkYZ0Xvs5GGdL3L9ZDgNjfY6
         0Q0Vk4h4gqz/XJ3cZk3YmUHn8K86xBlTJU1JnPKVj2cN3eZ7hfe6IcN5V0DpmpRPBbRo
         T8uO9ZB1k15lRi61wwNfrI4UoZR9Ik3zsqHYOOdFqXk9OF2dAygSqDp7GHIhUCJVNpEn
         MWcq00/2X1giSSIOzrGWyx6NA2ns5EaA/eGUnyMUAoP3ZmiBFHpfHOuQmVJ0tL6Ieepr
         8qRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770403540; x=1771008340;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOGdc6wfNaOI9v9IX5QMoxMm4Vd5Vb1VZWpK0b4QQ+U=;
        b=OTPHbYrXAMOZBzuqIQaYWKVMMXJNB8sdRy/IX1327XWsIcZfu0QD+0UbdcG6Rh1mem
         Tb2atvkkZUmJXntY+Eqc3DC+v8xb4+r1Z9kT1XpRvu5izhz641mTgAvkf+hySHfBtPjA
         SJfWhW/xry4wjng3Cc+GQN0Z1CstTkWDx99++WCISF4G2B4mak/yUlwIPVw0OfL59diE
         8fXYl3ZXVQ9r9AF90pLzAFIooI0sr+9M9I9qMiduRJY4vpsuEphtaDXoEl38hHHRXDC5
         +Jfj4Jj3MCH+Cmhb38J+XTg1/ppaVN1JY3HD2qrqQmEpQb8Z2kfIwDQTzmxzGTuc7SVv
         4hgg==
X-Gm-Message-State: AOJu0Yy9UCMEnif6b+icN7kLcsdu1KF4ERX/pEbu7oojkFmqsKbai7NR
	ElXJkfmAURiaLpAhkbKx2N4aosQssfTpxXJAAMyQrBxdOwfVTVJgS6GB
X-Gm-Gg: AZuq6aKzKC19HQiBGQQyjoEn2Kr0LjP7LFY2ncgxCFd9Y8hRmJIRh4/n/pOfz3/cjJk
	GhPcH3W6XujtmGrD/ur71uBsgmfVlLf6FU6VE050YsxJQre2W08nVI338J9GNQGhCvwZqQT98Sh
	I8qkxLemNjY7bEgbPcDA3S9fM/8zm3YJd7J75iZpzu4SHad+rVm3bfUQK3gDIgWVbrPtsoUDg2R
	BxxCZMngBmXkUlK9RAVW7mJsRHuTiThlj4wkAAqrlAYrx8GyAF2ZuC1rXVIKnIfkKfhCrLzimOL
	iFpxdJ7CplNp+0Ic8FxtB8QTzbZbycTC8c34lNlCrcJMRFWxt6oHzk2s2z8/pHZKfnhCGXcXJ6d
	f72M1LO/wINkx8GpxghvEuIcs2XS96mDnOSfJhc6y0/gXaiTFoOd8caST+SZTcbGjPwe/OvzI2X
	4ZcFXqlF78ucmtnpMrbkZgVf+Jo7iC2Dz1B/AY/Y9n1L429+ragf+z31K62pvjseWSeYzrcjBci
	/+YPpCRvGGY1O10hgHeSWDKt7NMphBsqQLvOECbrsVWkZc36JY6H6qfeaD7/eE=
X-Received: by 2002:a05:690c:101:b0:793:afdd:c5d7 with SMTP id 00721157ae682-7952aa644dcmr56735147b3.9.1770403539838;
        Fri, 06 Feb 2026 10:45:39 -0800 (PST)
Received: from localhost ([170.199.240.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a2417d7sm28267707b3.41.2026.02.06.10.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 10:45:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 12:45:38 -0600
Message-Id: <DG83ODWLEUH4.3USTRFB2ZE9EW@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary blank lines in
 rtw_io.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Tan Kai Zhe" <kaizhetan@yahoo.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260206001833.16857-1-kaizhetan.ref@yahoo.com>
 <20260206001833.16857-1-kaizhetan@yahoo.com>
In-Reply-To: <20260206001833.16857-1-kaizhetan@yahoo.com>

On Thu Feb 5, 2026 at 6:18 PM CST, Tan Kai Zhe wrote:
> Adhere to Linux kernel coding style.
>
> Reported by checkpatch:
>
> CHECK: Blank lines aren't necessary before a close brace '}'
>
> Signed-off-by: Tan Kai Zhe <kaizhetan@yahoo.com>

Looks good to me.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

ET
