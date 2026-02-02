Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ED734B18E
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 22:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770070945; cv=none; b=iN8J0lBgAcnWbyos8Wk3E7XbfU7e5JRTwX1AWgmUB4XGM0m7sj/+RhMrYgJ8qx8486hDhHMHHHYticyPDYZK17vX2ieQu4AswwqH2j5xk9sbh7N6aiX1LsyEmJspsmlMCwLBhELHqenWLsltAZbeo58514qsfGeLj0/3qMOksXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770070945; c=relaxed/simple;
	bh=O57yPyzJ8OkY1f4uJLZBuUTqVCcR6SJYJ+K13KBQke4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jO7QwNlyBZABQ/HzgMkqHjBVVPYh+8W2UVfOrH5kCyA6kmWvH6EAHzZx+C11dMedDMZSkKyx3G6+tON/nr9oqTp4gaKW5pXgTQUVoMTSrzLzzBLpMCBvrZ+LBlBucjyYKLxtw2X4hju7/OJt8Ar1Kp2LTX5SPWIrsoqG3mKOAvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbPIQqrs; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbPIQqrs"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64938fce805so4442216d50.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 14:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770070942; x=1770675742; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byuDbDXqsC+RTpprTwmnIg5GJlDhbXjIuCmiCm364zw=;
        b=EbPIQqrsCcicKvLjby7m2fjVVVY/917cUK8BIWdbh1KhPIbBYAtcZVm9NqcAPu+S1W
         I4msVoHQlBG036+5meRmEvDGsVdBR5xO0IJvh2uTJhl2igM021fbXJ1PKSiBP4V5v3ox
         NYEtSQytKQ5RElkm1fhqg6K7MungPdo5LaT+NOAaq3ThJYHr7skKB+SXjf5RBycd2QVy
         k/PIfis9M2L0XQlzesUcMXBPMhD2RDhD0F6c5/+7Nw3H04mLFP0SIZRvCZreTrXjhYAg
         zLN69CChwHBIbbwzsdS0hHOyUjC+ezQVnb/youtZBytQu6jspmuyVhd+/xgcCRYWmSZ9
         nuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770070942; x=1770675742;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=byuDbDXqsC+RTpprTwmnIg5GJlDhbXjIuCmiCm364zw=;
        b=EWsDouSys2ekYZInHMZ7csbci/vzlEd04VAkKrWY9DLfIlOHnGaC3G/laP3IvYOfVM
         ATG5t/jmQ7B0uev54QtRCfc/YbnyywYTsfFV1tZDjudR9dXdM9/K43If80YLAowyaX+P
         iQaJmlKwBvvQS9N3VavU0rI25aF7zfIfAit7VgDDig9j0I5Sl3evrmE246NKAolEuS8K
         oIeymH2h15kdLvN2lP0uQj5Rs4taUc937k3Y9KnfVs9O/RQ05kwobpUX/ZEPQFldSj42
         8O6Obzi2jGvZ5dISjm8JBYNeXN39fo8VyJBF/DLC4SW893xUSZQDxBUVUutByO0tslSZ
         5avw==
X-Forwarded-Encrypted: i=1; AJvYcCVRXoSvt0ppsvVB/xPfIz6lPFBIcrBDz7kKGpNtIDol+VvmCsx6AYFK3lthinoer919rAJ57WeHP5FhVHCK@lists.linux.dev
X-Gm-Message-State: AOJu0YwFGdR7+J/UbulIwmfUbi+4dDUPPBdeADyF9boemY1LmAWgp2eh
	DXQNhgd/2ve4p6QOWTe3Dyc4dzypcO/dGeGo2G6J4trDqZp0ClHbcIDm
X-Gm-Gg: AZuq6aLCBk3s2p1BUJF2+KOaIkp2pYGBpLboapQJzkyBmEeNAe6wFAxn0H2VeIKpvrK
	fSmbzY+ijeMMRHbhLWyz7wnD2U+U3ACWbq+6gM2AN3X0yVcGllNpr/hvrzorV0taC9jW3Sf62Hk
	1dhuVHGPoLpydYIMneZoYJDErzBbtBfAHPgx7Z50ZhZsMlQdvORazBoti1OR1fDVAOLyB82RL8b
	4A10jhftSwslMHeyDmv/ZmwGhIgioXBfx59iwfg+HqGLX8n2iucsISh/SZS1Cm22YlFZbHmsgM8
	6w/ob/VXVhWWM33/di5NxxqQc6F+BJyrXOgZH/xQzKEWn9kKNoPhACGns+qM3mxNkPgTyQ/3TP4
	qDgOXqeY9QPHBSiu0Bwre8bG7vwV1crCeDwo+lJtfKnopr3TlxqpJRjK1AJZ2rohp1JN4zSP5X+
	X/op07DpBChNcjByZeDXC5o+6as+tTaZ4=
X-Received: by 2002:a53:ac99:0:b0:649:6b11:78eb with SMTP id 956f58d0204a3-649a84ed9famr10328451d50.68.1770070942309;
        Mon, 02 Feb 2026 14:22:22 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649960642c6sm10280131d50.3.2026.02.02.14.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 14:22:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 16:22:07 -0600
Message-Id: <DG4TRYCISMJS.9GAR9YLQ0CNU@gmail.com>
Cc: "Johan Hovold" <johan@kernel.org>, "Alex Elder" <elder@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] staging: greybus: resolved checkpatch checks for
 fw-management.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Rachit Dhar" <rchtdhr@gmail.com>, "Viresh Kumar" <vireshk@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260202202643.160199-1-rchtdhr@gmail.com>
In-Reply-To: <20260202202643.160199-1-rchtdhr@gmail.com>

On Mon Feb 2, 2026 at 2:26 PM CST, Rachit Dhar wrote:
>  		ret =3D fw_mgmt_load_and_validate_operation(fw_mgmt,
> -				intf_load.load_method, intf_load.firmware_tag);
> +							  intf_load.load_method,
> +							  intf_load.firmware_tag);
>  		if (ret)
>  			return ret;
> =20

This should be it's own style patch. Please keep one logical change per pat=
ch.

ET
