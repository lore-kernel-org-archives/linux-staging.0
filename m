Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BFF420897
	for <linux-staging@lists.linux.dev>; Wed,  5 Aug 2026 10:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927296; cv=none; b=CiTyNMO7BFSda9+tJUHDKpFG6qjU3DYcnE46VEW8YB3Vx4w30CLxotHcxWGl9hqX1Plm6QJg1PY45kVYjYh894Sw1SK3JcMZGnS1ZMg1JqdmCtXqWzN1Nbpnh9uscWFLi7hJ4+8AjwCSZRPPSURwHtc8foQZC8TsDrMz5l/VjUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927296; c=relaxed/simple;
	bh=zdWIQ4XbdfNIiQOUQLO8ZRhdyOljfls9ev7Iy+S/wm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IH0TjUK5yxASpE1kapVg72LISAgHZswOJK5vEwWehv0AF78qQTjKMLgpIG5gMeHqJOHU9KwI0PbwOi+mN5R671ZOMMo+0ir/9DJOPC/mqK1dp8XUqd8IU93M9wKj3tFuKhZxKRB8MShAL+ihG5POP3Q/Y69nY2mNhtraMb+bHjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMo0HAKJ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMo0HAKJ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8484f229529so681922b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 05 Aug 2026 03:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785927294; x=1786532094; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1iSsiL0Omo09hV4VEUFV8jfMDXOERsw1/AgPbhwBt60=;
        b=qMo0HAKJoeM77nrzHtxU8QpmatPwVLW47oM7VtnftbgtTTDFLX7MpMcw/OHp5uDA4T
         WThfDVKfC0sK8kuCHU0lRr7cXaofU5CDwTfw0EOwMUgFmcU+gcP1XYh15CeORNIh91rE
         DEeAX1O8muwWAShPO9EZ+xX7QyMLAk0lkg6hp9hrwtMST0yxm22wQle5FUQsBAsy+JsY
         Le6WmUGkf9oXKXzYpvcS1tZ27Y03G3gSRBGbCymI6JwGdjCFa0387LKr0B3GlJjc9Db6
         JfBj8EyIcwscpaTFaGX25mJuB25ITm2bD3qtqo/rKa3p4dG1pA+kAtLFenE/SAvtgeif
         AARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927294; x=1786532094;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1iSsiL0Omo09hV4VEUFV8jfMDXOERsw1/AgPbhwBt60=;
        b=BHtseIcEIsOCFn6xySfQklKJgBftxhLWgplqIcUfov+VIA1nSOvSpnRj32rjoz8c2e
         mg1DP32vrNEtH+QXACwxl3KUB8GHjI4f5PT31rz+kDlVOff+O+s1RmCPzaIiKrraJpeD
         hxuGyyMMTtMfz9zbFSX5JJu9mrEBRR7XbH9ZvCsjA3JpwogzD66ed1kHCmb0naW1DUmA
         WlzmKONBqN1p6IiJVA3s3zFDjeJ80e7HWUNvFkSuVHbUOU1769I7IcfMjeQsnfBHuwLL
         aO3/x7ipI06yJiIgV6vJqqrG/bD8yPu00hBxgyy7CnQElmvJmdekA5/CQMEtk4kcAC5y
         4o+A==
X-Gm-Message-State: AOJu0Yy6WwCMsG/aHzCrx9spPnwtAHer1QpddNAFT2HT89peVmYlozRH
	emplKU3jlWdtpsSbr+haqXQpcsZEKuzH9ruKokMs/cHuk/COL3AzWuA1gmSJBO6qHz9bp9BF
X-Gm-Gg: AR+sD13bVzK6GBeDsDHuOoPRMtA411tgbkUisnEjI+7BR1f+M2dKIxOEGDTbyVltaK3
	EmbDzbQGFQ17wt9JvC4O171+FnvG2xEdh8KAmhnQ0u6+orGnPwcMRohkYliyZAC2MVRTUenzngE
	LNVA0FofrxmYbr//dQW2xsWDtsqZRpukpNI345IttrudtOR+1Kc9tSd07QWfCAxZH3xPNs1R3cI
	xwy2L/6AXbdN8FOUxaJKrOK+pmTGcdJDHinzfywolnUaJEN5Ng9WHiMy8uG9yJ2MsM8+cQC1VBz
	BTVFPxUHX+O9kphVF2mYJvFd9FYesKiLn74GKcahkyFSZKIRjQse0b761iQ39kDEkE1wBG4HMr2
	rSWx2Avzip4njOpkV3ucCkfEvRdtbMNl3Z37zYWaelxpP2XMFxPz1fCFlBxqJAXKxDJX1VCBbT8
	goK2J7SrQxJdr7koQyvudXCNxRznNzXXKJl3EK8+ZaeS4AXCQZXUYjjfxqsA==
X-Received: by 2002:a05:6a00:1250:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84f2e05124dmr5828466b3a.16.1785927294220;
        Wed, 05 Aug 2026 03:54:54 -0700 (PDT)
Received: from eos ([103.89.26.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe7092b9c6sm1342766a12.31.2026.08.05.03.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:54:53 -0700 (PDT)
From: =?UTF-8?q?=E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=E3=82=BA?= <reza1234khan1234@gmail.com>
To: linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org
Cc: Muhammad Bilal <meatuni001@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
Date: Wed,  5 Aug 2026 16:54:35 +0600
Message-ID: <20260805105436.176193-1-reza1234khan1234@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805103344.172115-1-reza1234khan1234@gmail.com>
References: <20260805103344.172115-1-reza1234khan1234@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

I'm aware of Muhammad Bilal's patch
<20260728125456.32359-4-meatuni001@gmail.com> that fixes the same
function. This patch is a superset of that one:

- It fixes the OOB read of the length byte in_ie[i + 1] when advancing
  to the next IE, which Bilal's patch also addresses.

- In addition, it fixes an OOB read in the 9-byte copy path: when a
  vendor specific IE with the 00:50:f2:02 OUI has a length byte smaller
  than 7, the loop copies in_ie[i] .. in_ie[i + 8] past the end of the
  buffer. Bilal's patch does not cover this case.

If you prefer to take Bilal's minimal fix first, I can rebase this as a
follow-up covering only the copy path. Otherwise, please let me know how
you'd like to proceed.

Thanks,
イムティヤズ
