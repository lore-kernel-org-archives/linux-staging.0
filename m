Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521B1307AC6
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 15:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775663293; cv=none; b=OwnkAL2fWhpO7Tuy5rvIaEsOnaDxZT0GGTCrb38yUikVn/5cmQx2H6Ptks7FtCeLGbQzlh8313JcBmieO6OAOjIlWYmpAD1IitePSpFcHZ95LomgDMP5QpecgusAHhcKAX8G06yOb3/CR8FbrGsCxrufVSTGAGKJ2ZmpvakVE7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775663293; c=relaxed/simple;
	bh=wFy/IxAGc+P8qx7An2ftMTR3samldIak9t1ER6ZVstM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=hfpQz9Wte8EkEg0HVM4MsZYT88S+fuJAYUAymKIorW12YhUWJy6oX2HmYcfznl3io9xR8rKeo13CXFmY7risnoL4QPc3Zthn0lWRt13hZ6XO1GZqF6bxN7SC7B1DMrwqWeyriQ2jJCB9Hy4S74aAzw+qEN1G8uyH3Xq0YLfk7VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TytTpRvH; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TytTpRvH"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775663286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wFy/IxAGc+P8qx7An2ftMTR3samldIak9t1ER6ZVstM=;
	b=TytTpRvHI2n8LVEA839xuoLXb5Jm5JZxF5j3e8iO6kZBBvkaxAuw9FC3DxZArFZdjPSY7a
	m8rJHBPsJDlF0Y6z3VlbnqBLf8IltSmghz+DqhMbRjmdTRzFgBfAENPCJUt4MSXEaEKVfP
	frBxZFHf2AFdVPTD/dUjwteI36tC3eY=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 17:47:59 +0200
Message-Id: <DHNW3LHUER5K.2T5VPXNKUD3ZD@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: =?utf-8?q?Bera_Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <ethantidmore06@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: rtl8723bs: remove unused function pointers
References: <20260404124947.52549-2-b9788213@gmail.com>
In-Reply-To: <20260404124947.52549-2-b9788213@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat Apr 4, 2026 at 2:49 PM CEST, Bera Y=C3=BCzl=C3=BC wrote:
> Remove unused struct members from _io_ops. With removal of this members
> some functions in sdio_ops.c became useless so they are also removed.
>
> Signed-off-by: Bera Y=C3=BCzl=C3=BC <b9788213@gmail.com>
> ---

...

LGTM.
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
