Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9509F342526
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 22:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772750889; cv=none; b=O0jb6q02XT1C5B15Eitad2cd7BJUDAG4ThrA16cai+BkEWRLBhGEZO29QLQ2W9TnqZoE80gfO3msJ6tKEWuIgZ5e8UfuG2O5oPQxohlbFk+IQhQD8B9A/OQXQAHQ5Q/V98OTsOua8Y41fM3/5c+t8CcruLACBqiwE6/tnhjkWtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772750889; c=relaxed/simple;
	bh=WEb8Os4KOm7rf5snW8yakWw2Ht+/0rcFJpndFs1dPL8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Zj2OGssP63BW0+LbkyxS59MSKUf4dyGjb8cn1hjdTwyg4BnfFswIndi2m6o3+vSsb7j5IV0WNxwXxQ5/xU101niMjf+VZ0/1T3na/qQ7cq0/1DV0MEIXwvb9ng4siFTOMpNMxqD9IMM/gTBaS4gClWjuP6j9QduCGbFkW5dUYsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbKukvUs; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbKukvUs"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7986d231b3cso113723037b3.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 14:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772750888; x=1773355688; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEb8Os4KOm7rf5snW8yakWw2Ht+/0rcFJpndFs1dPL8=;
        b=NbKukvUslUnTknTbIy3N2W6HFpnRgcJVuIaAwKlgcEmSFMSk1qaURHWweuk2HDbB7W
         lvbnrX37DBxvo/a8e8OI4+lUeJickaQL1GmkYgOoGWJQBF1WBPCj9yuCxZHG++5kY3af
         OEAx87ObN1LA0TAurcjfwX4arKV5Sn2i52Qhj8rA9DyIyQbRBa0oeyRQAfqTB055RNIu
         Umh5jFsWGH1X1xVDQeMFYCo4k+bdpbVMfJd/D0qXzs0SQgAXCOx54RPSum+YoWxJ9uqD
         8llr6LwfItPMvDFzW2nZt0TpAljM0thpUgyG2rX7Zs7VVf8HkJmnZNcoGKLOWcHfIUqi
         3Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772750888; x=1773355688;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WEb8Os4KOm7rf5snW8yakWw2Ht+/0rcFJpndFs1dPL8=;
        b=sKUOy54vsaYovozB0IJ8PTxwHjAaVLZ0dN3niAKDTdqCR7FkmanF0/a4OYbDxWzGgO
         iUpPpUiziuUVXruux7N3K3+Z0VTabwlzuCVQMezRXB+lfEvDM2HDpqla9Nc4wqu0WQRw
         3k3fymsn2waV57P43UwHpUFRrbwA3b1JKbmQbkKNqfYVBEln0HGzXzmdetEkJ1w8StiM
         zw88LCebBWHYrCt9nSYAK1yv38xbKUIgjd46v/Z6F9nxP3YF1Sul7r8E5LDhJWB2EbzD
         k8BdGEvgasEps9nX/f7N0vJ93Rzf/1+LLPGR7iIX81p61lXSqA0hzhqA/tgxpsr7oYd9
         XvIw==
X-Gm-Message-State: AOJu0YzUWkNeFokci27Bllq5sPCV+OB4lrFIlsYQDzfWQ93Jen9dmyE3
	TmHJ939Rr6dr+bhw5/1GVhvFVyAPU3QlrJQk0jB1bfOl8HHZTK4z7a0D6wkyGW1j11Q=
X-Gm-Gg: ATEYQzz5PBr+6qyumQbrnW+O77mBeoPEq7jeNgHCH27h8bzJ7EycdD0g/r31om0dA3U
	Vqr5oGHpAaC3gKdeiY/I0BE7/MD+ay4E9uvXGvaFQ7mUbjY34oLwEkngxC4TPY6Pxcw59SL64fP
	Yy3JGIlxC++G0RoaSCGus+/eLbIHcWkDPPzHGA1sCr2S4T42JcXXrRKWM2RErIIPirHZSd450M5
	l5SMWpYR7DHGa4NxGJO3fuMrLB2sGGLrjklYv9KR02R9V3Jbd+7SXDK/wcTbNv1Pn4HLMe56fRt
	UHpDLp5GQJMw3XWoeZIu4cJJoqRUlTetDQsypDL5bKTo/T9K/c7+JaG2gTWYY9mPuW8Y1bFi6QM
	PSvfYIKUJ2qrhDZMB2lVK8Vc+QD6xyrHUmyT8apSKe35ssb0hEuU0bGuo2O9YdHDQ7ox5jIV/Ou
	imdhc0rdkyNeURCYo+Y92GTx1Z8Je1hNzVLquZAhCNIhnyu/e4E7L/UHgV5b7cEGiTwa5tCVO26
	VscywBL+dOt5gylD04OgrPajmybIsnY
X-Received: by 2002:a05:690c:350c:b0:796:28aa:62eb with SMTP id 00721157ae682-798d1f28e05mr38031737b3.32.1772750887658;
        Thu, 05 Mar 2026 14:48:07 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a92c47sm94955737b3.3.2026.03.05.14.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 14:48:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 16:47:47 -0600
Message-Id: <DGV7QHUJG1U0.18VWD5DQ99RWP@gmail.com>
Cc: <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary return value
 from func
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Nikolay Kulikov" <nikolayof23@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260304183438.25228-1-nikolayof23@gmail.com>
In-Reply-To: <20260304183438.25228-1-nikolayof23@gmail.com>

On Wed Mar 4, 2026 at 12:34 PM CST, Nikolay Kulikov wrote:
> Function init_hw_mlme_ext() always returns '_SUCCESS', regardless of the
> result of it's work. Remove this unnecessary return and change function
> type to 'void' to simplify the code. Additionally, fix the line length
> exceeding 100 columns.
>
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
