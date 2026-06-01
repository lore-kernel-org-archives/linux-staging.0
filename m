Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5841465B4
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 00:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780274649; cv=pass; b=ZmTcJWrCqtx8NqypTnEpz81ohg/tt/9U5B3APk8+ewHrz+r50OXcBIxvwsCw4Xb0gkLCSLy4tnlrh1YNCE0Y7QClfN3ff/JqSuSMtW387X9tqQiZjXafVqmAr8SZH2wxLLXovWluFEVqLoIHXlvkQsvROJDSrp1pulhwzQHMDeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780274649; c=relaxed/simple;
	bh=6nxGQt97RD3cqY89Vnwl/bH8KNQoEZTs6S+OzTikdB0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BUSa10APd+/A5073nO5Ld12BClG93zorD5vkB0eXdpz9SR4ltPSxSUXdCdFvynzBP7SC3ehs9lNw/TX80JX6AkuVlqDZ3nhKdAs9s1zoHLJwkKTRx3LIGARIKfQ99NAnwp0ttBXYRgQfZ8ZmblbzvxVZlozROGIX0RlGlT1vC2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3QsQskd; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3QsQskd"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-137d452574cso1794769c88.0
        for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 17:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780274647; cv=none;
        d=google.com; s=arc-20240605;
        b=FSKZkhrNbZuIotFcLZ/+bd2JTFsyqJsPCT0YffFJErrx726pTyBfYF0c1Y+Ub/qOvj
         7kUMakKn5JMLK+SSfWCUkB8QekcXwnJq4xknCSbFC+0Qx1UpFYxsVmykNC/D0hY9yw7G
         bPqrDR0OodemrzGHH7ADvX3ufAw/soBzASy/9d/SY7lNHyOtrUe+c2IUYFxZ3QH3f6hd
         mSey9Ws/8l0vAsyc2cgMpRDbTYookYdM6ohdwZilIkQmrYuF/2YyR8OzQeT+SPLhkwnO
         4L3yFFhhGiAWE+r8JrKUEfkMQvDMbw5S486j/owgToNbxGoVh+Kv5WQ2VqHpR4D+gIQy
         cbeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=St8SQ1gSdmWTKrF8sfCTlvEzF6I8dA72iftkS3Fg46I=;
        fh=EK8P0/JcYwoyqU3aPSLNH8AD1rsgc35ZYv/NPskPcS8=;
        b=XKJzpw7qGljBXWB72irXdIid3KwNrbGoEKv6iKvgqNXnb4T7m0gelqWeoLn8K9pkGE
         xi/JXWRrbTGNsERCeNAf1dk7XmfYf9y4XXxlJMjQGatI6ci7ZYhMPs7ti5Ly9RJVz7mq
         OVqdK6cK6GX2J4I30yw2Q/nhqYTtZVVYo0cPMbG8KHEE0SrJeCqsi+VFZB8qSf89Sbbf
         zHNh0OvP2H/u8YJTYZX5+aqqHmxzSBD12eFc7Y9svnj6CCtbePf4pbogyeN5Sibl6mBR
         iBhdzvSwr2W3fzVLzWWTngoRy9aFnqJ1aWq1HogBOSi8W4Uo3xwZZw8PFw8U1kLHdkg7
         eOiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780274647; x=1780879447; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=St8SQ1gSdmWTKrF8sfCTlvEzF6I8dA72iftkS3Fg46I=;
        b=Q3QsQskdMIjIYfTrQpDxWQsDjVuUC1vaz52eAqB6VZlMFxvx1oXwXd0hTcRq6VtxvV
         Z0tBmJl+XBirKzKauBjXBrAnulLWYhfNzQIpSVOb8IFM/cPBviqXQgvaNe7rw9F6kPni
         4Mevpd/DrceMLwy8whTIW4B6p+T8TfJHAeaKT/DMd61Iacps8nkWYvmeccHVlJaWQx/W
         Aps28w7s4v447IJdsnLUHOq1D9UD9i3GU7ES4dmA7d1Qj0gE1KMaQRBBGtHl6Y+Cuab7
         zY2VkXY2rbPXHnrRq+/PH35KypPddEMDGquQGaPnqpCqRPEMb3QCRTbiCyCqKo9qGQ0w
         j59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780274647; x=1780879447;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=St8SQ1gSdmWTKrF8sfCTlvEzF6I8dA72iftkS3Fg46I=;
        b=gJpc/JSjtXieiqRzYlY4FJLsttdDf0ov6OIE1Zx3phy5tMg6efwvQES5FOWdAxG4HA
         mYnuGG8iI/IHaimD4PNgvj5X4QQx6+7pNvKHsfwZKZl5iUoFxfWH7ct8ojYnBIOxpymV
         xzY6dSGhyU1OychFC6HnR5r3M5fTru8CSuo8iLFmg9tuVahnUB6GUzDtRN8o/nO9q/uI
         R3GzYt9G4tWfbKf4uPyrdaWtMrmGm5dRIJiqVtFBCSZq2Nzc64C4cSqG7g3d/SQsBGkE
         Y4XWLRgLR+XBVq6JcqAehjIBK2pu2nFfxHD6+9mcizLeiuCscWYtS+loBvUdpRWF/US9
         9QJw==
X-Gm-Message-State: AOJu0YxKGa30hch/cxaoUIEluyZrDO5ic0Me9jRNtehTM1/rfudkLkPD
	1Yq55YVRm6595h3pzHv4jp44YMkr5rq38j2Sa/tfB7vVQaeGRkaGyacHJuZ/vmwQme7ENwSo+/Y
	nfWdurOsJmxRaal38Kizhfwwvn0DlY9g=
X-Gm-Gg: Acq92OEwPJuGGeTCWcCJWqcqsIbyXXdqu3tPi9uG/hUbZbn0AXQFClYXUOB9hlfIBUU
	1VlVkj4LaOKV5GL9zZzQkjLo1gGnsf2tzGRG+vd9elPqUPbDLoxdXrK7v0ENOJTM1ge3xBoFYkH
	gRpjHEiS9W32jo60zvJyc7Z7uQi5l8qJH6NpjPEH/wYt/f2Xv6kr5dKbD4WFgiuoRi6ZLgRdqj8
	oT5vBlw0FOxni6RmLDW5wsGgJTVqp2p0G8CJ+Zk03UnrZF1LnXD3YCw5ru+UVxATFKcRIro4WsY
	cMsNOW0Ng+5EzVcY/6prhWa2Vrgy
X-Received: by 2002:a05:7300:6c84:b0:2d8:97d6:6abc with SMTP id
 5a478bee46e88-304fa67401amr4424101eec.22.1780274646888; Sun, 31 May 2026
 17:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Enchanted Hunter <enchantedredhunter@gmail.com>
Date: Mon, 1 Jun 2026 03:43:55 +0300
X-Gm-Features: AVHnY4KBQe9-bwOHL2irZGJ83_sz5c6ViVOpW031dRkTwC4Ae5gAftJCTsj2gxE
Message-ID: <CAOSULec2OpwTGB3OUb_n3CdKO6H_DGJnxw=qsBswbd+JBjemKA@mail.gmail.com>
Subject: [PATCH] staging: fbtft: replace sprintf with snprintf
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, andy@kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="000000000000eeb4ee0653267d0a"

--000000000000eeb4ee0653267d0a
Content-Type: multipart/alternative; boundary="000000000000eeb4ec0653267d08"

--000000000000eeb4ec0653267d08
Content-Type: text/plain; charset="UTF-8"

This patch replaces unsafe sprintf calls with snprintf
infbtft_register_framebuffer() to prevent potential buffer
overflow.Signed-off-by: rat1bor <enchantedredhunter@gmail.com>

--000000000000eeb4ec0653267d08
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><pre><span>This patch replaces unsafe sprintf calls with snprintf in</span>
<span>fbtft_register_framebuffer() to prevent potential buffer overflow.</span>
<span></span>
<span>Signed-off-by: rat1bor &lt;<a href="mailto:enchantedredhunter@gmail.com">enchantedredhunter@gmail.com</a>&gt;</span></pre></div>

--000000000000eeb4ec0653267d08--
--000000000000eeb4ee0653267d0a
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-staging-fbtft-replace-sprintf-with-snprintf.patch"
Content-Disposition: attachment; 
	filename="0001-staging-fbtft-replace-sprintf-with-snprintf.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mpuhh6ek0>
X-Attachment-Id: f_mpuhh6ek0

RnJvbSBhNzljNjA5OGYyZThiYjJlZTllMjc2ZDMzOTcxMDUyMjE3NWRiOTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiByYXQxYm9yIDxlbmNoYW50ZWRyZWRodW50ZXJAZ21haWwuY29t
PgpEYXRlOiBNb24sIDEgSnVuIDIwMjYgMDM6MTg6NTkgKzAzMDAKU3ViamVjdDogW1BBVENIXSBz
dGFnaW5nOiBmYnRmdDogcmVwbGFjZSBzcHJpbnRmIHdpdGggc25wcmludGYKClNpZ25lZC1vZmYt
Ynk6IHJhdDFib3IgPGVuY2hhbnRlZHJlZGh1bnRlckBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9z
dGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYyB8IDcgKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdp
bmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUu
YwppbmRleCBjYTBjMzgyMjFjMTYuLjY2NTA5MzQ3MjU1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9z
dGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0
ZnQtY29yZS5jCkBAIC03ODQsMTAgKzc4NCwxMSBAQCBpbnQgZmJ0ZnRfcmVnaXN0ZXJfZnJhbWVi
dWZmZXIoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pCiAJZmJ0ZnRfc3lzZnNfaW5pdChwYXIpOwog
CiAJaWYgKHBhci0+dHhidWYuYnVmICYmIHBhci0+dHhidWYubGVuID49IDEwMjQpCi0JCXNwcmlu
dGYodGV4dDEsICIsICV6dSBLaUIgYnVmZmVyIG1lbW9yeSIsIHBhci0+dHhidWYubGVuID4+IDEw
KTsKKwkJc25wcmludGYodGV4dDEsIHNpemVvZih0ZXh0MSksICIsICV6dSBLaUIgYnVmZmVyIG1l
bW9yeSIsIHBhci0+dHhidWYubGVuID4+IDEwKTsKIAlpZiAoc3BpKQotCQlzcHJpbnRmKHRleHQy
LCAiLCBzcGklZC4lZCBhdCAlZCBNSHoiLCBzcGktPmNvbnRyb2xsZXItPmJ1c19udW0sCi0JCQlz
cGlfZ2V0X2NoaXBzZWxlY3Qoc3BpLCAwKSwgc3BpLT5tYXhfc3BlZWRfaHogLyAxMDAwMDAwKTsK
KwkJc25wcmludGYodGV4dDIsIHNpemVvZih0ZXh0MiksICIsIHNwaSVkLiVkIGF0ICVkIE1IeiIs
CisJCQkgc3BpLT5jb250cm9sbGVyLT5idXNfbnVtLCBzcGlfZ2V0X2NoaXBzZWxlY3Qoc3BpLCAw
KSwKKwkJCSBzcGktPm1heF9zcGVlZF9oeiAvIDEwMDAwMDApOwogCWZiX2RiZyhmYl9pbmZvLAog
CSAgICAgICAiJXMgZnJhbWUgYnVmZmVyLCAlZHglZCwgJWQgS2lCIHZpZGVvIG1lbW9yeSVzLCBm
cHM9JWx1JXNcbiIsCiAJICAgICAgIGZiX2luZm8tPmZpeC5pZCwgZmJfaW5mby0+dmFyLnhyZXMs
IGZiX2luZm8tPnZhci55cmVzLAotLSAKMi4zNC4xCgo=
--000000000000eeb4ee0653267d0a--
