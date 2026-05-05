Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D598D23BD06
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 17:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001959; cv=none; b=ngKssccTOXkjAdW2OwjsqSP/+QceEgtfrJ2w08jEJIGVP76XXLUqz1ZD/GxzbWD5wjS9n2u7JWUgtJB4qARwStbP9UJ6Jw9jklthEz4d6upO3mWTxIyR6DvJ8lPF0s4HC7st1c3NOPXaDoP3Ebg97QDPwaUYH9xTLw9nFEQHEz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001959; c=relaxed/simple;
	bh=7loG3jdpxhl6XWPzcFcE/VnTjZhAzfFCy10yjTtFAEk=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=f1n8F0pF6pGsIN5IJ9411peKHXYdRLaIB1VnBoo6sbo9Wu5kJsHapuTV4kG9yWH8hUeQymHuRiycKvoOW5yhFWI54QaYjjgLIvdO6rYl2/9M0Zxb182eZlrJfSuSXDUEE3xA+sCHLneC/Ge0N963bt7tLhXeZVtLOGO137bmZk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bv5jERz7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bv5jERz7"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-444826c16ffso5314262f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 10:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778001956; x=1778606756; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f78N6Uz4A3+HInYy358FeHv+WgsoceYalamqSENz5qA=;
        b=Bv5jERz7nDho+Ngc799HiX6MOhGBt6PQBx16JhNvkuDYz025C6gTHBFRbjnzFOmq3X
         brSIQ9H3dfDCRzCmgvE5ia47+Zwoxh7guaxeNOEBTVB7FMYNfVIg+ixJo7iKKfcQckck
         noQYtBXrqzWbIzVqNAsoArZP37zrqrMYCxG/8KJLfRIWxa/j7kuuVVcJnmH1VLboAZOd
         0rA2HzWCNYRcZfpY5o70zqWpUY2QNX0QWOrEd+E4D+07HloSI2rmMwtMt/YymIkeq8O4
         3ux4P+s4eKyt8vC3rZfN77ZuhnZlFURUTOI6SJfl4wEbnJVlGVUVnGCYbKtzJhYgj7eM
         O2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778001956; x=1778606756;
        h=references:in-reply-to:subject:cc:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f78N6Uz4A3+HInYy358FeHv+WgsoceYalamqSENz5qA=;
        b=l2kB8odctIGATPb9I+m0tOktIDuNo0wXuH48xvX9eX1WaFwU+GJr8eH+g/0w/jwffR
         5FBv2Y2mf/Cpq1iHtZru40ju+Tikk2YaLFdpIE/H+nqV1fWtDpAgVVwCchznPIu5ov6W
         5wpLScRheRwzU4p1iJ8Sz5fLK3MPPYVSZ8bjHWmg+g6VS2WjzGnqH/bP1tsRYkPbxGC0
         /4Cs6nJqFEJGzY3wbSD7AitdQ0dEKW674orEoMQIzBe2pxJeIz4mWLxObf9MXkySbgoG
         GQeejHKp6nDx8Ei6PVHwoHdd7CgUUHlSjdR4kbpwshmsjhm3hiqlMEDuermGC3tOf3F7
         bFJg==
X-Gm-Message-State: AOJu0YzazEqRH2Kn8O7t73ZovcBRTFmfTIaTzShF7jMCB4yUe91Jjyc9
	+rbAcT3mmGpSdl3Uc7QIuGqvGLuIGaWE/U8UzTwgHGhnPxmLHwv2nQ20
X-Gm-Gg: AeBDieu5zmat0A7WWWSX3KS1kKlLqUtYMwFfukUjW3j2EV1p6fsAmma1OE2vyQFHDTK
	ONWGyG7hMZ32/womvcry8GS46Hu5NJOBFW4+O/mZevZSnfEvJZhpuBaBk642TGSH3hLvImvJBWI
	dz2D+SmPOcvuPDKpep6pJLv8n051oUG/YIB2uNb8er6d9HOEn06TH2ETlBM9AMenDmlqaroNt+b
	3DBJxVYFJIJQSsYg39HCVpQ17y92Lo67ilR3IN2JDntOjC6JriHEQxtUTcicPjQ/jx3eEKtuCU3
	4vnUOFccy5qQ5J5dMHYP2W0f3hjZ9Mqu4rgM2PrYbpOoy5obZ7OdfP139aou4UeDhDt89Vk2kuK
	SNu76j8pclaH+1ND/+bOmoBHg5VIILfcGQDN02Vj4MQKNZQ+WM+wFmK+kNrmrEmksvZ8N9nKrwC
	JdW7e9FQQw9dk8p7paA2kP5KWbqedpqxAEui6C7e7PslpcjLEy1WPeUWXLOQkkFvPTHOuF2eTE+
	6gep2yjXM28NPVKt8mThC00ld9jdltFSMrzZVTURLn3gtvtZx7Svz9kFNh8aBJpzLzWbh0=
X-Received: by 2002:a05:6000:2902:b0:43d:50c:6f33 with SMTP id ffacd0b85a97d-4515cf11c1bmr39215f8f.26.1778001956181;
        Tue, 05 May 2026 10:25:56 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm6119609f8f.26.2026.05.05.10.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:25:55 -0700 (PDT)
Message-ID: <69fa2823.050a0220.240e08.8b1f@mx.google.com>
Date: Tue, 05 May 2026 10:25:55 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============1478946647153134699=="
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, error27@gmail.com, luka.gejak@linux.dev
Subject: Re: [PATCH v3 0/3] staging: rtl8723bs: fix OOB reads and heap overflow in IE parsing
In-Reply-To: <20260427081626.3393697-1-hossu.alexandru@gmail.com>
References: <20260427081626.3393697-1-hossu.alexandru@gmail.com>

--===============1478946647153134699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Greg,

To answer your question about hardware: I do not have rtl8723bs hardware
available.  The patches in this series are derived from static analysis
of the code, cross-checking against the 802.11 spec, and reviewing the
patterns already in use elsewhere in the same driver.

I am working on v4 to address the sashiko review comments and will send
it shortly.

Thanks,
Alexandru
--===============1478946647153134699==--
