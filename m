Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F2C303C94;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142005; cv=none; b=nSC988ieK6PpKVxGed0+y7oLL5cwDqnXQMR4o4D70IQ3NZlmvBjoIHN9F8qSP5heJG8xbLmxU5VgdW4ZVnv8lDXAs88YFn7H9qUaWpfkCcaOSxNaKZ1H6vuufxYOThIEUToFsNIATG2+qQwr7eS/pV9dBx18xJtOs71B/gamBxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142005; c=relaxed/simple;
	bh=cF17zGVFV4ZnlfnDlhdLorJqqOiVe0AkoBNOXzOIVq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L5Sj3IbCY1pjL1mAsxIosrRkQllaNU/zpCqt9cIuS3KK6Js3/tK4vudiDZWJRJt+RSEqHVjEa6JzT9z7vQGyudDsJsiHpl+zkyaD8q2IIgfl/U3Zr2lzRaQ1sJvlAlrhkEq8Wh5E/dzS5242PiIIzvrEJn20K4K4WgTLDqKPBZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hptSDVd9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hptSDVd9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DA8C116D0;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766142005;
	bh=cF17zGVFV4ZnlfnDlhdLorJqqOiVe0AkoBNOXzOIVq0=;
	h=From:To:Cc:Subject:Date:From;
	b=hptSDVd9rJ+sQfCpAjzdrIQywtj8+SakhoZJRr4mEtn7SuZrqctokQ34Lmyi8p3Es
	 s1XAaICPjM1ESQJxoSyXnI8xeJgd56p7ziuR5XgV7eu78HaXRz1LSt9OgHXqLUacaR
	 KKnRmwuUgULgFXCbx/PJoxFQa3cjk0NZfS41H85bw9E9UdhWVQM8DGLfP4HJb6jA9z
	 eIzUCmK/UdJQ++HzKAeiSmpN5Dyj8+01vh1AiSpt3CytMSVhXYbhbpo0+RedvlGQ7D
	 zdeImO07HH6gNKgQUeApejHPyblZ2Sbyb8zNVRSGx6pvlPnU1aI55J/I/q6eE0snfA
	 qkNL2cpA52Smg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWYDL-0000000065b-15qd;
	Fri, 19 Dec 2025 12:00:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: greybus: arche-platform: fix probe issues
Date: Fri, 19 Dec 2025 11:59:25 +0100
Message-ID: <20251219105928.23329-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes some issues with the arche platform drivers probe
function.

A fix for the first issue was sent to the list two months ago, but there
has been no reply to the review feedback given then.

Non of these are tagged for stable backport as very few people should
have the hardware in question and be bothered by this.

Johan


Johan Hovold (3):
  staging: greybus: arche-platform: fix coldboot probe error path
  staging: greybus: arche-platform: fix memleak on probe failure
  staging: greybus: arche-platform: fix OF populate on driver rebind

 drivers/staging/greybus/arche-platform.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

-- 
2.51.2

