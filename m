Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0AA35D615;
	Mon, 23 Mar 2026 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774254639; cv=none; b=pBBWfMerUxsnEVLy03f+LV732koko5urz4FObYVA/AmxrmU4ACcPWSohOlhghM5KMiGjhqpBK4gggljAy79i/gZP6FPELqX87NkfVIqcZ0eUmbpzsdMBv/2MvADgO0g4XovKXg1rUKf3FavicOdQqoiBhrPy8JdoVKtwQEEVLTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774254639; c=relaxed/simple;
	bh=daaBGV5H2AOvuS5QSuAjGe1Xj2PrkECRfxkI+NwtPeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJfL39wephYUdKg025reckw6NYyKKyWbma551XRrE1ZptzcKa2P4O4GCqTWAgu4X3etAs/j/wVw7A5idnt6jAnhpNQkJ+0zYrmeYnUZdvVQbd7EciWAmNdcB/RBz++xzPSVPVNQMj16z6Sg6RNDU0TluvpKZKVUa/QjS2fBJbgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowACHqN8n+sBpE8qHCw--.12667S2;
	Mon, 23 Mar 2026 16:30:32 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: jernej.skrabec@gmail.com
Cc: mripard@kernel.org,
	paulk@sys-base.io,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@kernel.org,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: Re: [PATCH 7/7] media: cedrus: validate HEVC slice reference lists
Date: Mon, 23 Mar 2026 16:30:31 +0800
Message-ID: <20260323083031.30930-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260323070314.42949-1-pengpeng@iscas.ac.cn>
References: <20260323070314.42949-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACHqN8n+sBpE8qHCw--.12667S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYP7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI
	0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUb0D73UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Hi Jernej,

Thanks, that makes sense.

You're right, this is not really Cedrus-specific. The missing validation
belongs in the common HEVC slice control path, so I'll respin it there
instead of keeping it in the Cedrus driver.

Thanks for pointing that out.

Best regards,
Pengpeng

