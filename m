Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635E9526A90
	for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 09:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067934; cv=pass; b=mcYW7hUkDbbkMKi7vN/PEs3FAF5/dTeJurtVvpZa7sWoARW8IFlqU2nvJ7/dY5Ev4Cxbn1WLRKZyZVZCztwOBAtG3TjlJNEJtHN6E1sZhYQRZCw8f5YL41zXIKLwwLp8SRPLZpNkDpx6osKnCnp7hhRsjPVwP14NK/ZD9fCFyzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067934; c=relaxed/simple;
	bh=6VxrMknAVb1vDWNanfZgZOBYSwjkUtQT3TOXrqHvrks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQ8lUNVvakuhyQkrjs46uIImb3eEnmE/e2KW319ot+t1CNEgVYBN6SPfvIiBlfrgcySDDyz8qYd6h2CkvoleiW5oqJawL6M+kBvbmiv5586oMVBllXx6D/yPmyMoK1zu/0AqKntEzEYVt5CwPoop6eBGr21nWrattEv4oGjiZu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCmOEyxH; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCmOEyxH"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so576444366b.2
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 02:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790067930; cv=none;
        d=google.com; s=arc-20260327;
        b=AAJxilBpvxFo3A9fV1hpo6xFT/aCUYJnESsEoSeRCmTHKyTCFgHCYrEqGQdkIHNqf5
         XbE0ivb+mtSDW4xDSI//TPyLdfN7gdTdrCTrhGJROE6r75NwhDhbwh5TNYHb+QvRf7BF
         4FxCBYn0+Jddi9LdKCJEDys9ENIHZ624Wa+5abL7+LOfhPIGJAHsgJQVq64Np1xy3YTV
         B9gPV4Qqq9xgQFsc4GCOms8PTtvjDjQwg/Ff7ipNQgehfWNpTT8sWHjOHd30/Rf74RMj
         VIOaL2BH70vdWxOvTNzlQZbIWr2S7cx77/rE80PzVnHi2QybnIUXBr31AdYd5IjEdVNE
         3sRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6VxrMknAVb1vDWNanfZgZOBYSwjkUtQT3TOXrqHvrks=;
        fh=P84bI1Zh6w7DDDA9t+2CJCO8bxTij9NErZFlfS7lFEg=;
        b=JWTvPQ8e+drJjQHON0yQcD29Tz/WMWhAVFA8jN2ZmDt6ARGXuDIRF4HEgLmnpXqGIo
         YEwQrCBkizcnYYVL0Cp8/OJ/vEjYhsQGf+P5DyXYC7NqId895f7LliiZC3IsJaISZ94b
         EL3+ue4SDk7Q2ApHb1zb6hfJVX7UEjZi3p8oj92eWdokDVcMapCvd4Cg6Rq+0wLk56qi
         Y1vnogF7MnOBdsEnz270Tz+XcPji2l8zCMu3pFzTbhtFLSzUblKeZycQrTo4ElFVJK5y
         TF+38cJGiEF1rcaqLZUTiFJscowsEqsqFPRLRjUQ4xsmjybJZf0CCsa41fIkkjYwUj/Q
         TYDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790067930; x=1790672730; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6VxrMknAVb1vDWNanfZgZOBYSwjkUtQT3TOXrqHvrks=;
        b=VCmOEyxHm18lpbGaVzA7uWIHl97BXPcKnpex7Cp2rFfrpTRzO5SQwkiM6mw7PV/yfh
         fkrXzvUTn74AopF/OwCYrjTorULBJa7GXog90cX4VNfLCG9Yirr0yiMAHWX68lKfz6ua
         wEq3urwa5qThD7HmfONTUySi+oyx93cRcDCAPSRSUHFH0eMPIXDyzXAZ0w9wR5sWJ6E4
         8A7xKpjIQeS/kCZuFNASIj2r5wT54aZtpcLGfl1mJEVGIgc8cC9H8hFKVSLlBL1dwqQH
         xSPEaF+vksSqE39Adu+PAf8lduNmEBkKrX+vVV88r09NlTIFInQZywNlWjWMQeV8pYLm
         IK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790067930; x=1790672730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VxrMknAVb1vDWNanfZgZOBYSwjkUtQT3TOXrqHvrks=;
        b=SYhVN7qxanH/vRQ7O3vf7DW318zjeoqEfMIa6oi5IZUy+0xjJqFpk7xYFkKrfCegSe
         K8HZgmPwIES2MnM9cWCnWtXAELOwHJOQViN5BillgojRCzkImigDCpWUlBAuCLHRZfhb
         MheP47XpHob6ilKz8iP9oH8Qj3A3kfZcg7Y416rQIqpBy2aOv6vNSr+4Nwo0l+Cmj6Nm
         STBZK6P755fOCnWQP6MX8nguly29Fj21sCc5Vvf72vOv3p2xBNUp1gWG/uE+L2KFPZNb
         Wo7pxL4pZGggCXXO8QvvVnQKzLezNTfUd5kDXJQF1YDfTgkIrNSqLIC22gNo3lENCn2i
         QHuw==
X-Forwarded-Encrypted: i=1; AKwUvBzeApQ+EwZOtoKztsp+9vGFIb1DAIVS7rlTadJAnHxMqo7yqNqYJ1IS5QiwhmrYzINwgzxqrqqgM4lSx884@lists.linux.dev
X-Gm-Message-State: AFuF++mitt56nAUUQFM1cnqS+ODZT7jDSJ835cGBSsUFEnFsFVTFbTUj
	qcuhwWEE+RaAklvC0X7croZOzltT5iPtpyrRChwJcBciGwJdma7l8FMVLkXUNqk/L/o5O7ym6En
	yWfnKjfzx5q9WGFXZSMIlPTfbsNgKQwQ=
X-Gm-Gg: AYBFou0LH8s6C58zYrgAD+MI2Uqs/5b6vRC5rtvZLUKBFFmp31LiWKrAXgwWEFqFkvu
	+IGvRN5HhMGLf/ndwQQN4uLABkUQbcBF2GrhigQ5bnGJQgkikkaoyoFnAxPftxc5QxEU03sk2EC
	14HNgG8Z6PrFhqWy8SWtGnvRsfrYGeJcUYCNKK6uhtoAfClfD8wS54M+9lE3S5QEax/3QK0DQOE
	GOtuU21wVchV1UnVOmbe/U4qk6c2utUrEWH0NwZ7P/OpMtS/FEDSgCWBGLe3QEE17VnL2632+T4
	wgPMZau+COOyC2ZgalaavtJRDobS9sOy1fwAT3yEZjqen0cC7Z4nhQhYKJDcXUngINRbF7JYUa4
	ecYwphUFKhLBeXi6BktwOCZVyHiF+WaPGK8cyN7bM8k8x3fD1XNxteg7aUZ1E9JtwCj20afPh5b
	EgJfmHG4QOJT8nvPXO80/SLrBFqJTwxVK/atTpAxnDwLzDocFloVQd
X-Received: by 2002:a17:906:c10b:b0:c26:19de:9139 with SMTP id
 a640c23a62f3a-c2a15cf8ea1mr1261725566b.44.1790067930361; Tue, 22 Sep 2026
 02:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921183313.92795-1-hikarialiyev@gmail.com>
In-Reply-To: <20260921183313.92795-1-hikarialiyev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 22 Sep 2026 11:04:53 +0200
X-Gm-Features: AcwNN1X5O3CnNVl33I3dVh03PNniNtuSKukKjtL-OpPtcpVg5gCiGP8Rn-l-Dyo
Message-ID: <CAHp75Ve=Wxe=2VjuEyMaeigskU=CmWDLN0baFbxwJ54pKDponw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: fbtft-bus: remove space before close parenthesis
To: UgwuRhema <hikarialiyev@gmail.com>
Cc: gregkh@linuxfoundation.org, Andy Shevchenko <andy@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 8:33=E2=80=AFPM UgwuRhema <hikarialiyev@gmail.com> =
wrote:
>
> Fix checkpatch.pl errors regarding prohibited spaces before closing
> parentheses in fbtft-bus.c while retaining trailing commas required
> by macro definitions.

It makes no sense. It's a false positive of checkpatch.

--=20
With Best Regards,
Andy Shevchenko
